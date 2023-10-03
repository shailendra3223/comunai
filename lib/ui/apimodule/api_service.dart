import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../utils/constantBaseUrl.dart';
import '../client/dioClient.dart';
import '../model/login_response/login_response.dart';
import '../model/otp_page/otp_response_data.dart';
import '../model/signup/signup_response.dart';


class ApiService {
  static var client = http.Client();

  static final DioClient _dioClient = DioClient(

  );


  /*TODO------------------- Login Phone -------------------TODO*/
  static Future<LoginResponse> login(String phoneNumber) async {
    try {
      final body = {
        "phone_number": phoneNumber,
      };
      print('loginResponse $body');
      var response = await _dioClient
          .post(
          '${ConstantBaseUrl.baseurl}v1/api/auth/users/login/otp', data: body);
      print('loginResponse $response');
      if (response["success"] == true) {
        print('success $response');
        return LoginResponse.fromJson(response);
      } else {
        throw Exception('Invalid mobile number!');
      }
    } on Error catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception(e);
    }
  }

  /*TODO------------------- Login Phone Otp-------------------TODO*/
  static Future<OtpResponseData> loginOtp(String phoneNumber,
      String otpString) async {
    try {
      final body = {
        "phone_number": phoneNumber,
        'otp_string': otpString
      };
      print('otpResponse $body');
      var response = await _dioClient
          .post('${ConstantBaseUrl.baseurl}v1/api/auth/users/login/otp/verify',
          data: body);
      print('loginResponse $response');
      DioClient.token = response['token'];
      //  DioClient.tempToken = response['temp_token'];
      return OtpResponseData.fromJson(response);
    } on Error catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception(e);
    }
  }

  /*TODO-------------------  Sign Up user List -------------------TODO*/
  static Future<SignupResonse> signUp(String first_name, String email_address,
      String date_of_birth, String gender) async {
    try {
      String myString = "\$2b\$12\$iZ3xXgHhQJzDnjcGLeiyquKtdnhc.XqI4HXWgFQ2qXmRnmbqmjnci";
      final body = {
        "temp_token": myString,
        "phone_number": "+917977170737",
        "first_name": first_name,
        "last_name": 'xyz',
        "email_address": email_address,
        "date_of_birth": date_of_birth,
        "gender": gender
      };
      print('signup $body');
      var response = await _dioClient
          .post(
          '${ConstantBaseUrl.baseurl}v1/api/auth/users/register', data: body);
      print('signup $response');
      DioClient.token = response['token'];
      return SignupResonse.fromJson(response);
    } on Error catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception(e);
    }
  }

}