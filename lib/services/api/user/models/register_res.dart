// To parse this JSON data, do
//
//     final registerResDto = registerResDtoFromJson(jsonString);

import 'dart:convert';

RegisterResDto registerResDtoFromJson(String str) =>
    RegisterResDto.fromJson(json.decode(str));

String registerResDtoToJson(RegisterResDto data) => json.encode(data.toJson());

class RegisterResDto {
  RegisterResDto({
    this.id,
  });

  String id;

  factory RegisterResDto.fromJson(Map<String, dynamic> json) => RegisterResDto(
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
      };
}
