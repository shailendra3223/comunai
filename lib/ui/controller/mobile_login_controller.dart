import 'package:comunai/ui/account_setuppage/otp_page.dart';
import 'package:comunai/ui/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../utils/constant.dart';
import '../apimodule/api_service.dart';
import '../model/login_response/login_response.dart';

class MobileController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  Rx<PhoneNumber?> selectedPhoneNumber = Rx<PhoneNumber?>(null);

  RxBool isMobileValid = false.obs;
  List<String> countryCodes = [
    '+1 (United States)',
    '+44 (United Kingdom)',
    '+91 (India)',
    // Add more country codes here
  ];
  // Regular expression for validating a 10-digit Indian mobile number
  final RegExp mobileRegex = RegExp(r'^[6-9]\d{9}$');

  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener(validateMobile);
  }

  void validateMobile() {
    isMobileValid.value = mobileRegex.hasMatch(textEditingController.text);
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  Future<void> login(String phoneNumber) async {
    try {
      final LoginResponse response = await ApiService.login(phoneNumber);
      print("dsdsda " +response.message.toString());
      // await SharedPreferencesHelper().setString(PrefsConst.userId, response.result!.userId.toString());
      // await SharedPreferencesHelper().setString(PrefsConst.PROFILEPATH, response.result!.profileImgPath.toString());
      // await SharedPreferencesHelper().setString(PrefsConst.username, response.result!.userName.toString());
      // await SharedPreferencesHelper().setBool(PrefsConst.logInSaved, true);
      /* profileIcon = response.result!.profileImgPath.toString();
      username = response.result!.userName.toString();*/
      Get.to(()=>OtpPage(mobileNo:phoneNumber ,));
      update();

    } catch (e) {
      print(e.toString());
      Get.snackbar("Invalid Phone Number!", 'Please Enter Valid Mobile Number',
          backgroundColor: AppColors.textColor,
          colorText: Colors.white);
      // Handle exception
    }
  }

}
