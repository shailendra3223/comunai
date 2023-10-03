import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_setuppage/mobile_login.dart';
import 'color.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(
                'assets/img/star.png',
                height: 60,
                width: 60,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const ListTile(
            title: Text(
              'Discover your tribe,seek support,and offer help to those just like you.',
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                'Never feel alone in your \n health journey.',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: AppColors.textColor),
              ),
            ),
          ),
          const SizedBox(height: 200),
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 0.85,
            height: 55,
            color: AppColors.btnColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Get.to(() => MobileLoginPage());
            },
            child: const Text(
              "Get Started",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Montserrat",
                  letterSpacing: 1,
                  fontSize: 18.0),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'By continuing, I accept the',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    ' and ',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Privacy Policy.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
