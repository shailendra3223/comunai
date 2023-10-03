import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../color.dart';
import 'main_start_page.dart';
class UserSelfProfile extends StatefulWidget {
  const UserSelfProfile({super.key});

  @override
  State<UserSelfProfile> createState() => _UserSelfProfileState();
}

class _UserSelfProfileState extends State<UserSelfProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: WillPopScope(
        onWillPop: () async{
          _onBackPressed();
          return false;
        },
        child: Column(
          children: [
            const ListTile(
                title: Text(
                  "Who are you using this \n app for?",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text(
                    'This helps us tailor the app specific to \n your needs.',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: AppColors.textColor, fontSize: 14.0),
                  ),
                )
            ),
            Column(
              children: [
                InkWell(
                  onTap: (){
                    Get.to(()=>MainStartPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: 58,
                      width: MediaQuery.of(context).size.width*0.95,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        color: Colors.grey.shade50,
                        child:const Center(
                          child: Text('My Self',
                            style: TextStyle(fontSize: 16.0,color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    // Get.to(()=>MainStartPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: 58,
                      width: MediaQuery.of(context).size.width*0.95,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        color: Colors.grey.shade50,
                        child:const Center(
                          child: Text('Someone I know',
                            style: TextStyle(fontSize: 16.0,color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Get.to(()=>MainStartPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: 58,
                      width: MediaQuery.of(context).size.width*0.95,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        color: Colors.grey.shade50,
                        child:const Center(
                          child: Text('Myself & someone I know',
                            style: TextStyle(fontSize: 16.0,color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Object _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to exit an App'),
          actions: <Widget>[
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.grey.shade300,
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('No'),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.orangeAccent.shade100,
              onPressed: () {
                SystemNavigator.pop();
                // Navigator.of(context).pop(true);
              },
              child:const Text('Yes'),
            )
          ],
        );
      },
    ) ?? false;
  }
}
