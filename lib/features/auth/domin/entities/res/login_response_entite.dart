// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';


LoginResponse loginResponseFromJson(String data) {
  return LoginResponse.fromJson(json.decode(data)); // string 
}

String loginResponseToJson(LoginResponse data) {
  return json.encode(data.toJson());    // json 
}

class LoginResponse {
  LoginResponse({
    required this.username,
    required this.customerId,
    required this.token,
    required this.customerRoles,
  });

   String username;
  int customerId;
  String token;
  String customerRoles;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      username: json["username"] ?? '',
      customerId: json["customer_id"] ?? 0,
      token: json["token"] ?? '',
      customerRoles: json["customer_roles"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "customer_id": customerId,
      "token": token,
      "customer_roles": customerRoles,
    };
  }
}

