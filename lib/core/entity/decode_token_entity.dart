import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class DecodeTokenEntity {
  final String name;
  final String phoneNumber;
  DecodeTokenEntity({required this.name, required this.phoneNumber});

  factory DecodeTokenEntity.fromJson(Map<String, dynamic> json) {
    return DecodeTokenEntity(
      name: json["Name"] ?? "",
      phoneNumber: json["PhoneNumber"] ?? "",
    );
  }

  static DecodeTokenEntity getData() {
    String token = AppSharedPreferences.getToken(); // Retrieve the token
    if (!JwtDecoder.isExpired(token)) {
      Map<String, dynamic> json = JwtDecoder.decode(token); // Decode the token
      return DecodeTokenEntity.fromJson(json); // Create the entity from JSON
    }
    return DecodeTokenEntity.fromJson({});
  }
}
