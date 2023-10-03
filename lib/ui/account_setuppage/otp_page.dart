import 'package:comunai/ui/account_setuppage/account_setup.dart';
import 'package:comunai/ui/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color.dart';
import 'otp_input.dart';

class OtpPage extends GetView {
  OtpController _controller = Get.put(OtpController());

  // 4 text editing controllers that associate with the 4 input fields
  final String mobileNo;
  String? _otp;

   OtpPage({required this.mobileNo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<OtpController>(
        builder: (value) {
          return Column(

            children: [
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ListTile(
                    title: Text('Enter Otp',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                    ),
                  ),
                  ListTile(
                    title:const Text('We’ve sent an OTP via SMS to your phone :',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16.0// Color of the specific text// You can apply other styles as well
                      ),),
                    subtitle:   Text(mobileNo,
                      textAlign: TextAlign.start,
                      softWrap: true,
                      style:const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0// Color of the specific text// You can apply other styles as well
                      ),),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  // Implement 4 input fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpInput(_controller.fieldOne,true),
                      OtpInput(_controller.fieldTwo,false),
                      OtpInput(_controller.fieldThree,false),
                      OtpInput(_controller.fieldFour,false),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Resend code in',
                        style: TextStyle(color: AppColors.textColor,fontSize: 16.0),),
                      SizedBox(
                        width: 5,
                      ),
                      Text('00:20',
                        style: TextStyle(color: Colors.black,fontSize: 16.0),),
                    ],
                  ),
                  const SizedBox(height: 50.0),

                ],
              )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width*0.85,
                    height: 45,
                    color: AppColors.btnColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0)),
                    onPressed: () {
                      // Get.to(()=>AccountShow());

                      //  value.showAlertDialogForEvaluation(context);

                      if(value.fieldOne.text.isNotEmpty&&value.fieldTwo.text.isNotEmpty&&value.fieldThree.text.isNotEmpty&&value.fieldFour.text.isNotEmpty){
                        value.addotp();
                        if(value.otp!=null && value.otp.isNotEmpty){
                          FocusManager.instance.primaryFocus?.unfocus();
                          value.sendLoginOTPApi(mobileNo,value.otp);
                        }
                     }
                      else{
                        Get.snackbar("Error","Please Enter Otp Sent to Your Phone" ,backgroundColor: Colors.white,colorText: Colors.black);
                      }
                    },
                    child:  const Text('Submit OTP',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
              ),

            ],
          );
        }
      ),
    );
  }
}
