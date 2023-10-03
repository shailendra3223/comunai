class Signupbody {
  String? tempToken;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? dateOfBirth;
  String? gender;

  Signupbody(
      {this.tempToken,
        this.phoneNumber,
        this.firstName,
        this.lastName,
        this.emailAddress,
        this.dateOfBirth,
        this.gender});

  Signupbody.fromJson(Map<String, dynamic> json) {
    tempToken = json['temp_token'];
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    emailAddress = json['email_address'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp_token'] = this.tempToken;
    data['phone_number'] = this.phoneNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email_address'] = this.emailAddress;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    return data;
  }
}
