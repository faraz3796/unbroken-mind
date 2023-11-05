import 'package:chat_app/LoginScreen/login_screen.dart';
import 'package:chat_app/RegisterScreen/register_screen.dart';
import 'package:chat_app/variables.dart';
import 'package:flutter/material.dart';
import '../Widgets/widgets_classes.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CustomText(
             text: "App Name",
             textWeight: FontWeight.bold,
             textSize: 23,
             textColor: primaryColor,
           ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: "Explore your thoughts here . . .",
              textWeight: FontWeight.bold,
            ),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Hero(tag: "LogoImage", child: Image.asset(
                boarding,
              )),
            ),
            SizedBox(height: 20,),
            CustomButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
              },
                text: "Get Started !",
                background: primaryColor,
                foreground: secondaryColor
            ),
            SizedBox(height: 20,),
            CustomButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
              },
                text: "Already have an account ?",
                background: secondaryColor,
                foreground: primaryColor
            ),

          ],
        ),
      ),
    );
  }
}


