class User {
  User({
    this.firstname,
    this.lastName,
  });

  String? firstname;
  String? lastName;

  User copyWith({
    String? firstname,
    String? lastName,
  }) =>
      User(
        firstname: firstname ?? this.firstname,
        lastName: lastName ?? this.lastName,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastName: json["lastName"] == null ? null : json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname == null ? null : firstname,
        "lastName": lastName == null ? null : lastName,
      };
}
