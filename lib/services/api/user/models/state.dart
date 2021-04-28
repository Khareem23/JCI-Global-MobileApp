// To parse this JSON data, do
//
//     final state = stateFromJson(jsonString);

import 'dart:convert';

State stateFromJson(String str) => State.fromJson(json.decode(str));

String stateToJson(State data) => json.encode(data.toJson());

class State {
  State({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<String> data;

  factory State.fromJson(Map<String, dynamic> json) => State(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
      };
}
