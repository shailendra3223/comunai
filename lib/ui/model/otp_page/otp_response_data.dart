class OtpResponseData {
  String? tempToken;
  String? token;
  bool? userExist;

  OtpResponseData({this.tempToken, this.token, this.userExist});

  OtpResponseData.fromJson(Map<String, dynamic> json) {
    tempToken = json['temp_token'];
    token = json['token'];
    userExist = json['user_exist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp_token'] = this.tempToken;
    data['token'] = this.token;
    data['user_exist'] = this.userExist;
    return data;
  }
}
