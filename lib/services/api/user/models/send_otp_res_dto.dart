// To parse this JSON data, do
//
//     final sendOtpResDto = sendOtpResDtoFromJson(jsonString);

import 'dart:convert';

SendOtpResDto sendOtpResDtoFromJson(String str) =>
    SendOtpResDto.fromJson(json.decode(str));

String sendOtpResDtoToJson(SendOtpResDto data) => json.encode(data.toJson());

class SendOtpResDto {
  SendOtpResDto({
    this.message,
  });

  String message;

  factory SendOtpResDto.fromJson(Map<String, dynamic> json) => SendOtpResDto(
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
      };
}
