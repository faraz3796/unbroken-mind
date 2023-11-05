import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../BoardingScreen/boarding_screen.dart';
import '../Widgets/widgets_classes.dart';
import 'package:chat_app/variables.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}): super(key: key);
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BoardingScreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                tag: "LogoImage",
                child: Image.asset(icon,width: 130,height: 130,)),
            SizedBox(height: 10,),
            CustomText(
              text: "App Name",
              textSize: 22,
              textWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }

}
