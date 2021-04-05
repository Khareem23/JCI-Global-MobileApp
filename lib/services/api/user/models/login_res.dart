// To parse this JSON data, do
//
//     final loginResDto = loginResDtoFromJson(jsonString);

import 'dart:convert';

LoginResDto loginResDtoFromJson(String str) =>
    LoginResDto.fromJson(json.decode(str));

String loginResDtoToJson(LoginResDto data) => json.encode(data.toJson());

class LoginResDto {
  LoginResDto({
    this.status,
    this.message,
    this.data,
  });

  final String status;
  final String message;
  final String data;

  factory LoginResDto.fromJson(Map<String, dynamic> json) => LoginResDto(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data,
      };
}
