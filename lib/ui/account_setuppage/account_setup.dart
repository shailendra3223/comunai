import 'package:comunai/ui/account_setuppage/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color.dart';

class AccountShow extends StatelessWidget {
  const AccountShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const ListTile(
              title: Text(
                "Account Setup",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                  'Choose how you want to proceed.',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: AppColors.textColor, fontSize: 14.0),
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.grey.shade50,
              child: InkWell(
                onTap: (){
                  Get.to(()=>SignUpPage());
                },
                child:const ListTile(
                  leading: Icon(Icons.mail,color: Colors.black,),
                    title: Text('Continue with Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0,color: Colors.black),),
                    // Icon(Icons.mail,color: Colors.black,),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
