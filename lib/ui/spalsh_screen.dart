import 'dart:async';
import 'package:comunai/ui/start_page.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => StartPage()
            )
        )
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    // color:const Color(0x00D0D0D0),
                    decoration:const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/img/star.png",),
                        )
                    ),
                  ),
                  const Text('Comunai',style: TextStyle(fontSize: 22.0,color: Colors.black),),
                  const SizedBox(height: 12,),
                  const Text('Connecting health',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColors.textColor),)
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}