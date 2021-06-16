class Failure {
  String message;

  Failure({required this.message});

  factory Failure.fromJson(Map<String, dynamic> json) =>
      Failure(message: json['message']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
