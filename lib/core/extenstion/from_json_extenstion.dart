import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

extension HttpHelper on Response {
  dynamic get jsonBody {
    try {
      return jsonDecode(body);
    } catch (e) {
      return {};
    }
  }

  bool get isSuccess => statusCode <= 200 && statusCode >= 210;
}

extension HttpResponseTimeout on Future<http.Response> {
  Future<http.Response> onTimeout() {
    return timeout(
      const Duration(seconds: 30),
      onTimeout: () => http.Response("Time Out", 408),
    );
  }
}
