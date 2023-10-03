
import 'package:comunai/ui/model/signup/signup_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constant.dart';
import '../account_setuppage/user_self_profile.dart';
import '../apimodule/api_service.dart';
import '../color.dart';

class SignupController extends GetxController{

  @override
  void onInit() {
    super.onInit();

  }

  Future<void> signup(String firstName,String email_address,String date_of_birth,String gender) async {
    try {
      final SignupResonse response = await ApiService.signUp(firstName,email_address,date_of_birth,gender);
      Get.snackbar("SingUp Successfully", "${Constant.message}",
          backgroundColor: AppColors.textColor,
          colorText: Colors.white);
      print(response);
      Get.to(()=>UserSelfProfile());
      update();

    } catch (e) {
      print(e.toString());
      Get.snackbar("Invalid User Identify!", 'Something is missing',
          backgroundColor: AppColors.textColor,
          colorText: Colors.white);
      // Handle exception
    }
  }

}