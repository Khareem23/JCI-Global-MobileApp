class LoginResDto {
  String accessToken;
  String refreshToken;
  String userId;
  bool isConfirmed;

  LoginResDto(
      {this.accessToken, this.refreshToken, this.userId, this.isConfirmed});

  LoginResDto.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    userId = json['userId'];
    isConfirmed = json['isConfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['userId'] = this.userId;
    data['isConfirmed'] = this.isConfirmed;
    return data;
  }
}
