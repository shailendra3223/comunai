import 'package:comunai/ui/dashboard.dart';
import 'package:comunai/ui/spalsh_screen.dart';
import 'package:comunai/ui/start_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final box = GetStorage();
  bool logInValue = false;

  MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // home: box.read("isUserExists")==null||box.read("isUserExists")==""?SpashScreen(): DashBoardPage(),
    );
  }
}
