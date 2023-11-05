import 'package:chat_app/LoginScreen/login_screen.dart';
import 'package:chat_app/Widgets/widgets_classes.dart';
import 'package:chat_app/variables.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _email = TextEditingController();

  var _password = TextEditingController();

  var _name = TextEditingController();

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
                       text: "Sign Up",
                       textSize: 23,
                     ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                CustomText(
                  text: "Fullname",
                ),
                SizedBox(height: 10,),
                CustomTextFormField(
                  hintText: "FullName",
                  border: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Email';
                    }
                    return null;
                  },
                  insideTextColor: secondaryColor,
                  contentPadding: EdgeInsets.all(20),
                  filled: true,
                  controller: _name,
                  borderThickness: 0,
                  obscureText: false,
                  fillColor: Colors.black26,
                  borderRadius: BorderRadius.circular(30),
                  prefixIcon: Icon(Icons.drive_file_rename_outline_rounded,color: secondaryColor,),
                  focusedBorderColor: secondaryColor,
                  focusedBorderThickness: 3,
                  focusedBorderRadius: BorderRadius.circular(30),
                ),
                SizedBox(height: 10,),
                CustomText(
                  text: "Email",
                ),
                SizedBox(height: 10,),
                CustomTextFormField(
                  hintText: "Email",
                  border: true,
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
                  obscureText: false,
                  contentPadding: EdgeInsets.all(20),
                  filled: true,
                  controller: _email,
                  borderThickness: 0,
                  fillColor: Colors.black26,
                  borderRadius: BorderRadius.circular(30),
                  prefixIcon: Icon(Icons.email_outlined,color: secondaryColor,),
                  focusedBorderColor: secondaryColor,
                  focusedBorderThickness: 3,
                  focusedBorderRadius: BorderRadius.circular(30),
                ),
                SizedBox(height: 10,),
                CustomText(
                  text: "Password",
                ),
                SizedBox(height: 10,),
                CustomTextFormField(
                  hintText: "Password",
                  border: true,
                  obscureText: _isObscure,
                  controller: _password,
                  filled: true,
                  insideTextColor: secondaryColor,
                  contentPadding: EdgeInsets.all(20),
                  borderThickness: 0,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Password';
                    }
                    else if(value.length<6){
                      return "Enter at least 6 characters";
                    }
                    return null;
                  },
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
                    if(formKey.currentState!.validate()){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> LoginScreen()));
                      _email.clear();
                      _password.clear();
                      _name.clear();
                    }
                  },
                    text: "Sign Up",
                    background: primaryColor,
                  foreground: secondaryColor,
                ),
                SizedBox(height: 20,),
                Center(
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                  }, child: CustomText(
                    text: "Already have an account ?",
                    decoration: TextDecoration.underline,
                  ),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
