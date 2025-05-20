import 'package:flutter/foundation.dart';

class ApiUrl {
  late final String _link;
  //? host Name :
  static const String hostName = "doctormanag2025-001-site1.qtempurl.com";
  //? base Url :
  static const String baseUrl = "https://$hostName/api/";
  static const String basePath = "/api/";
  static const String scheme = "https";
  ApiUrl(this._link);
  getLink({Map<String, dynamic>? queryParameters}) {
    if (kDebugMode) {
      print('Http request : $_link');
    }
    return Uri(
      host: hostName,
      scheme: scheme,
      path: basePath + _link,
      queryParameters: queryParameters?.map(
        (key, value) => MapEntry(key, value is List ? value : value.toString()),
      ),
    );
  }
}
