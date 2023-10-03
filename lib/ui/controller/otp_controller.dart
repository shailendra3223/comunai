import 'package:comunai/ui/model/otp_page/otp_response_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import '../../utils/constant.dart';
import '../account_setuppage/account_setup.dart';
import '../apimodule/api_service.dart';
import '../color.dart';


class OtpController extends GetxController {
  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();

  late String otp;
  bool isOtpVerifying = false;

  @override
  void onInit() {
    super.onInit();
  }

  void addotp(){
    otp = fieldOne.text+fieldTwo.text+fieldThree.text+fieldFour.text;
    print(otp);
    isOtpVerifying = true;
    update();
  }



    Future<void> sendLoginOTPApi(String phoneNumber,String otpString) async {
      try {
        final OtpResponseData response = await ApiService.loginOtp(phoneNumber,otpString);
        Get.snackbar("Otp Successfully", "${Constant.message}",
            backgroundColor: AppColors.textColor,
            colorText: Colors.white);
        Get.to(()=>AccountShow());
        update();
        // await SharedPreferencesHelper().setString(PrefsConst.userId, response.result!.userId.toString());
        // await SharedPreferencesHelper().setString(PrefsConst.PROFILEPATH, response.result!.profileImgPath.toString());
        // await SharedPreferencesHelper().setString(PrefsConst.username, response.result!.userName.toString());
        // await SharedPreferencesHelper().setBool(PrefsConst.logInSaved, true);
        /* profileIcon = response.result!.profileImgPath.toString();
      username = response.result!.userName.toString();*/
        update();

      } catch (e) {
        print(e.toString());
        Get.snackbar("Invalid Phone Number!", 'Please Enter Valid Otp Number',
            backgroundColor: AppColors.textColor,
            colorText: Colors.white);
        // Handle exception
      }
    }



}

