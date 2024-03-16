import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_url.dart';

//! all api method with configuration to send http request
class ApiMethods {
  late Map<String, String> headers;

  ApiMethods() {
    headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      // "Authorization": "Bearer ${AppSharedPreferences.getAccToken()}"
    };
  }

  //? using this function for all get requests
  //? when the parameter does not needed set as empty value
  Future<http.Response> get(
      {required String url,
      required Map<String, dynamic> path,
      required Map<String, dynamic> query}) async {
    query.removeWhere((key, value) => value == null);
    if (path.isNotEmpty && query.isNotEmpty) {
      return await http.get(ApiUrl(url).getPath(path).getQuery(query).getLink(),
          headers: headers);
    } else if (query.isNotEmpty) {
      return await http.get(ApiUrl(url).getQuery(query).getLink(),
          headers: headers);
    } else if (path.isNotEmpty) {
      return await http.get(ApiUrl(url).getPath(path).getLink(),
          headers: headers);
    } else {
      return await http.get(ApiUrl(url).getLink(), headers: headers);
    }
  }

  //? using this function for all post requests
  //? when the parameter does not needed set as empty value
  Future<http.Response> post(
      {required String url,
      required body,
      required Map<String, dynamic> query}) async {
    if (body != null && query.isNotEmpty) {
      return await http.post(ApiUrl(url).getQuery(query).getLink(),
          body: jsonEncode(body), headers: headers);
    } else if (query.isNotEmpty) {
      return await http.post(ApiUrl(url).getQuery(query).getLink(),
          headers: headers);
    } else {
      return await http.post(ApiUrl(url).getLink(),
          body: jsonEncode(body), headers: headers);
    }
  }

  //? using this function for all pu requests
  //? when the parameter does not needed set as empty value
  Future<http.Response> put(
      {required String url,
      required body,
      required Map<String, dynamic> query}) async {
    if (query.isEmpty) {
      return await http.put(ApiUrl(url).getLink(),
          body: jsonEncode(body), headers: headers);
    } else {
      return await http.put(ApiUrl(url).getQuery(query).getLink(),
          body: jsonEncode(body), headers: headers);
    }
  }

  //? using this function for all delete requests
  //? when the parameter does not needed set as empty value
  Future<http.Response> delete({required String url}) async {
    return await http.delete(ApiUrl(url).getLink(), headers: headers);
  }
}
