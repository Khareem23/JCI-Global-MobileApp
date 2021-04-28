// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
    Country({
        this.status,
        this.message,
        this.data,
    });

    String status;
    String message;
    List<Datum> data;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.country,
        this.callingCode,
        this.alpha3Code,
        this.alpha2Code,
        this.currency,
        this.flag,
    });

    String country;
    String callingCode;
    String alpha3Code;
    String alpha2Code;
    String currency;
    String flag;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        country: json["country"] == null ? null : json["country"],
        callingCode: json["callingCode"] == null ? null : json["callingCode"],
        alpha3Code: json["alpha3Code"] == null ? null : json["alpha3Code"],
        alpha2Code: json["alpha2Code"] == null ? null : json["alpha2Code"],
        currency: json["currency"] == null ? null : json["currency"],
        flag: json["flag"] == null ? null : json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "country": country == null ? null : country,
        "callingCode": callingCode == null ? null : callingCode,
        "alpha3Code": alpha3Code == null ? null : alpha3Code,
        "alpha2Code": alpha2Code == null ? null : alpha2Code,
        "currency": currency == null ? null : currency,
        "flag": flag == null ? null : flag,
    };
}
