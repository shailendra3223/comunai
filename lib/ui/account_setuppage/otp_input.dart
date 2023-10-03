import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_start_page.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextFormField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        style: const TextStyle(color: Colors.black),
        enabled: true,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)
            ),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)
            ),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter OTP';
          }
          return null;
        },
      ),
    );
  }
}