import 'package:chat_app/RegisterScreen/register_screen.dart';
import 'package:chat_app/Widgets/widgets_classes.dart';
import 'package:chat_app/variables.dart';
import 'package:flutter/material.dart';
import '../HomeScreen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _email = TextEditingController();

  var _password = TextEditingController();

  bool _isObscure = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void togglePassword() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
          child: Form(
            key: formKey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Center(
              child: Column(
                children: [
                  Hero(
                      tag: "LogoImage",
                      child: Image.asset("assets/images/appLogo.png",width: 150,height: 150,)),
                  SizedBox(height: 20,),
                 CustomText(
                   text: "Login",
                   textSize: 23,
                 ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            CustomText(
              text: "Email",
            ),
            SizedBox(height: 20,),
            CustomTextFormField(
              hintText: "Email",
              border: true,
              obscureText: false,
              controller: _email,
              validator: (value) {
                bool validemail = RegExp(
                    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')
                    .hasMatch(value!);
                if (value.isEmpty) {
                  return 'Please enter a Email';
                } else if (!validemail) {
                  return "Please Enter Valid Email";
                }
                return null;
              },
              insideTextColor: secondaryColor,
              contentPadding: EdgeInsets.all(20),
              filled: true,
              borderThickness: 2,
              fillColor: Colors.black26,
              borderRadius: BorderRadius.circular(30),
              prefixIcon: Icon(Icons.email_outlined,color: secondaryColor,),
              focusedBorderColor: secondaryColor,
              focusedBorderThickness: 3,
              focusedBorderRadius: BorderRadius.circular(30),
            ),
            SizedBox(height: 20,),
            CustomText(
              text: "Password",
            ),
            SizedBox(height: 20,),
            CustomTextFormField(
              hintText: "Password",
              border: true,
              filled: true,
              obscureText: _isObscure,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a Password';
                }
                else if(value.length<6){
                  return "Enter at least 6 characters";
                }
                return null;
              },
              controller: _password,
              insideTextColor: secondaryColor,
              contentPadding: EdgeInsets.all(20),
              borderThickness: 0,
              fillColor: Colors.black26,
              borderRadius: BorderRadius.circular(30),
              prefixIcon: Icon(Icons.password_rounded,color: secondaryColor,),
              suffixIcon: GestureDetector(
                onTap: togglePassword,
                child: Icon(
                  _isObscure
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: secondaryColor,
                ),
              ),
              focusedBorderColor: secondaryColor,
              focusedBorderThickness: 3,
              borderColor: secondaryColor,
              focusedBorderRadius: BorderRadius.circular(30),
            ),
            SizedBox(height: 40,),
            CustomButton(
              onPressed: (){
                if(formKey.currentState!.validate()) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  _email.clear();
                  _password.clear();
                }
    },
                text: "Sign In",
                background: primaryColor,
                foreground: secondaryColor
            ),
            SizedBox(height: 20,),
            Center(
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
              }, child: Text("Sign Up Instead ?",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 15
              )
              )),
            )
            ],
    ),
          ),
        ),
      ),
    );
  }
}
