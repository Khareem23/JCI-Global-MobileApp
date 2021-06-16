// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  const Register({
    this.email,
    this.firstName,
    this.phoneNumber,
    this.lastName,
    this.password,
    this.pin,
    this.country,
    this.state,
    this.city,
    this.postalCode,
    this.address,
    this.gender,
    this.dateOfBirth,
    this.businessName,
    this.businessRegNumber,
    this.accountType,
    this.userRole,
  });

  final String? email;
  final String? firstName;
  final String? phoneNumber;
  final String? lastName;
  final String? password;
  final String? pin;
  final String? country;
  final String? state;
  final String? city;
  final String? postalCode;
  final String? address;
  final String? gender;
  final DateTime? dateOfBirth;
  final String? businessName;
  final String? businessRegNumber;
  final int? accountType;
  final int? userRole;

  Register copyWith({
    String? email,
    String? firstName,
    String? phoneNumber,
    String? lastName,
    String? password,
    String? pin,
    String? country,
    String? state,
    String? city,
    String? postalCode,
    String? address,
    String? gender,
    DateTime? dateOfBirth,
    String? businessName,
    String? businessRegNumber,
    int? accountType,
    int? userRole,
  }) =>
      Register(
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        pin: pin ?? this.pin,
        country: country ?? this.country,
        state: state ?? this.state,
        city: city ?? this.city,
        postalCode: postalCode ?? this.postalCode,
        address: address ?? this.address,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        businessName: businessName ?? this.businessName,
        businessRegNumber: businessRegNumber ?? this.businessRegNumber,
        accountType: accountType ?? this.accountType,
        userRole: userRole ?? this.userRole,
      );

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        email: json["email"] == null ? null : json["email"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        password: json["password"] == null ? null : json["password"],
        pin: json["pin"] == null ? null : json["pin"],
        country: json["country"] == null ? null : json["country"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
        postalCode: json["postalCode"] == null ? null : json["postalCode"],
        address: json["address"] == null ? null : json["address"],
        gender: json["gender"] == null ? null : json["gender"],
        dateOfBirth: json["dateOfBirth"],
        businessName:
            json["businessName"] == null ? null : json["businessName"],
        businessRegNumber: json["businessRegNumber"] == null
            ? null
            : json["businessRegNumber"],
        accountType: json["accountType"] == null ? null : json["accountType"],
        userRole: json["userRole"] == null ? null : json["userRole"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "firstName": firstName == null ? null : firstName,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "lastName": lastName == null ? null : lastName,
        "password": password == null ? null : password,
        "pin": pin == null ? null : pin,
        "country": country == null ? null : country,
        "state": state == null ? null : state,
        "city": city == null ? null : city,
        "postalCode": postalCode == null ? null : postalCode,
        "address": address == null ? null : address,
        "gender": gender == null ? null : gender,
        "dateOfBirth":
            dateOfBirth == null ? null : dateOfBirth!.toIso8601String(),
        "businessName": businessName == null ? null : businessName,
        "businessRegNumber":
            businessRegNumber == null ? null : businessRegNumber,
        "accountType": accountType == null ? null : accountType,
        "userRole": userRole == null ? null : userRole,
      };
}
