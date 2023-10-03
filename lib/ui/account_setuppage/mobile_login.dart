// import 'package:comunai/ui/color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controller/mobile_login_controller.dart';
// import 'otp_page.dart';
//
// class MobileLoginPage extends GetView<MobileController> {
//   final MobileController mobileController = Get.put(MobileController());
//   final TextEditingController textEditingController = TextEditingController();
//   String?mobileNumber;
//   String? selectedCountryCode;
//    final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//
//       ),
//       body: GetBuilder<MobileController>(
//
//         builder: (value) {
//           return Column(
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     const ListTile(
//                         title: Text(
//                           "Your phone number ?",
//                           style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                         subtitle: Padding(
//                           padding: EdgeInsets.only(top: 8.0),
//                           child: Text(
//                             'Enter your 10 digit phone number.',
//                             textAlign: TextAlign.left,
//                             style: TextStyle(color: AppColors.textColor, fontSize: 16.0),
//                           ),
//                         )
//                     ),
//                     Form(
//                       key: _formKey,
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: TextFormField(
//                           validator: (input) {
//                             if (input!.isEmpty) {
//                               return 'Please enter an Mobile Number';
//                             }
//                             return null;
//                           },
//                           onSaved: (input) => mobileNumber = input,
//                           controller: textEditingController,
//                           cursorColor: Colors.black,
//                           decoration: InputDecoration(
//                               hintText: "Enter Mobile Number",
//                               contentPadding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
//                               // prefix: Text('+91'),
//                               border:  OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 borderSide: const BorderSide(
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 borderSide: const BorderSide(
//                                   color: Colors.black,
//                                 ),
//                               )
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//

//         }
//       ),
//     );
//   }

// }

import 'package:comunai/ui/controller/mobile_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../color.dart';

class MobileLoginPage extends StatelessWidget {
  MobileController mobileController = Get.put(MobileController());
  String? mobileNumber;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  const ListTile(
                      title: Text(
                        "Your phone number ?",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Enter your 10 digit phone number.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: AppColors.textColor, fontSize: 16.0),
                        ),
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(
                    () => Form(
                      key: _formKey,
                      child: Wrap(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                // Customize the border color
                                width: 1.0, // Customize the border width
                              ),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                      15.0)), // Customize border radius
                            ),
                            child: InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                mobileController.selectedPhoneNumber.value =
                                    number;
                              },
                              selectorConfig: const SelectorConfig(
                                showFlags: false,
                                useEmoji: false,
                              ),
                              initialValue:
                                  mobileController.selectedPhoneNumber.value ??
                                      PhoneNumber(isoCode: 'IN'),
                              textFieldController: TextEditingController(),
                              inputDecoration: const InputDecoration(
                                hintText: '000000 0000',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15),
                              ),
                              errorMessage: '',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),
//               const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.80,
                height: 48,
                color: AppColors.btnColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final selectedPhoneNumber =
                        mobileController.selectedPhoneNumber.value;
                    if (selectedPhoneNumber != null) {
                      mobileController.login(selectedPhoneNumber.phoneNumber!);
                      print('Phone Number: ${selectedPhoneNumber.phoneNumber}');
                    }
                  } else {
                    Get.snackbar("Error", "Phone Number is Mandatory",
                        backgroundColor: AppColors.textColor,
                        colorText: Colors.white);
                  }
                  // Get.to(()=>OtpPage());
                },
                child: const Text(
                  'GET OTP',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
