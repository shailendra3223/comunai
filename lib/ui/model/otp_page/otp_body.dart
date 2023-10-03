class OtpBody {
  String? _phoneNumber;
  String? _otpString;

  OtpBody({String? phoneNumber, String? otpString}) {
    if (phoneNumber != null) {
      this._phoneNumber = phoneNumber;
    }
    if (otpString != null) {
      this._otpString = otpString;
    }
  }

  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;
  String? get otpString => _otpString;
  set otpString(String? otpString) => _otpString = otpString;

  OtpBody.fromJson(Map<String, dynamic> json) {
    _phoneNumber = json['phone_number'];
    _otpString = json['otp_string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this._phoneNumber;
    data['otp_string'] = this._otpString;
    return data;
  }
}
