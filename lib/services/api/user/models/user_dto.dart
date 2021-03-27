// To parse this JSON data, do
//
//     final userDto = userDtoFromJson(jsonString);

import 'dart:convert';

UserDto userDtoFromJson(String str) => UserDto.fromJson(json.decode(str));

String userDtoToJson(UserDto data) => json.encode(data.toJson());

class UserDto {
  UserDto({
    this.id,
    this.email,
    this.lastName,
    this.firstName,
    this.userName,
    this.balance,
  });

  String id;
  String email;
  String lastName;
  String firstName;
  String userName;
  num balance;

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        userName: json["userName"] == null ? null : json["userName"],
        balance: json["balance"] == null ? null : json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "lastName": lastName == null ? null : lastName,
        "firstName": firstName == null ? null : firstName,
        "userName": userName == null ? null : userName,
        "balance": balance == null ? null : balance,
      };
}
