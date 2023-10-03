import 'package:comunai/ui/color.dart';
import 'package:flutter/material.dart';
class MainStartPage extends StatelessWidget {
  const MainStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff142b66),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.70,
          child: Column(
            children: [
              Image.asset('assets/img/star_white.png',
              height: 140,
              width: 140,),
              const ListTile(
                title: Text('Now let’s set up your health profile.',
                    style: TextStyle(color: Colors.white,fontSize: 38,),
                  softWrap: true,
                  textAlign: TextAlign.center,
              ),
                subtitle:Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(" This won't take long,\n we promise.",
                    style: TextStyle(color: AppColors.textColor,fontSize: 18,),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 24,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
