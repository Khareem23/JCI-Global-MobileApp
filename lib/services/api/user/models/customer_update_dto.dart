// To parse this JSON data, do
//
//     final customerUpdateDto = customerUpdateDtoFromJson(jsonString);

import 'dart:convert';

CustomerUpdateDto customerUpdateDtoFromJson(String str) =>
    CustomerUpdateDto.fromJson(json.decode(str));

String customerUpdateDtoToJson(CustomerUpdateDto data) =>
    json.encode(data.toJson());

class CustomerUpdateDto {
  CustomerUpdateDto({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.country,
    this.state,
    this.city,
    this.postalCode,
    this.address,
    this.phoneNumber,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? country;
  String? state;
  String? city;
  String? postalCode;
  String? address;
  String? phoneNumber;

  CustomerUpdateDto copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? country,
    String? state,
    String? city,
    String? postalCode,
    String? address,
    String? phoneNumber,
  }) =>
      CustomerUpdateDto(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        country: country ?? this.country,
        state: state ?? this.state,
        city: city ?? this.city,
        postalCode: postalCode ?? this.postalCode,
        address: address ?? this.address,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  factory CustomerUpdateDto.fromJson(Map<String, dynamic> json) =>
      CustomerUpdateDto(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        country: json["country"] == null ? null : json["country"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
        postalCode: json["postalCode"] == null ? null : json["postalCode"],
        address: json["address"] == null ? null : json["address"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "country": country == null ? null : country,
        "state": state == null ? null : state,
        "city": city == null ? null : city,
        "postalCode": postalCode == null ? null : postalCode,
        "address": address == null ? null : address,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
      };
}
