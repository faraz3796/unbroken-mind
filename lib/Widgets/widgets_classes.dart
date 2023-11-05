import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import '../variables.dart';

class CustomText extends StatelessWidget {

  final String text;
  final double textSize;
  final FontWeight textWeight;
  final String textFamily;
  final Color textColor;
  final FontStyle textStyle = FontStyle.normal;
  final TextDecoration decoration;


  const CustomText({
    super.key,
    this.text = "Type Here ...",
    this.textColor = Colors.black,
    this.textFamily = "Serif",
    this.textSize = 15,
    this.decoration = TextDecoration.none,
    this.textWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: textWeight,
        fontFamily: textFamily,
        fontStyle: textStyle,
        decoration: decoration,
        color: textColor,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  String text = "Text";
  Color background = Colors.black;
  Color foreground = Colors.white;
  final VoidCallback onPressed;

  CustomButton({
    required this.text,
    required this.background,
    required this.foreground,
    required this.onPressed
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30),
      child: Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(onPressed: onPressed, child: CustomText(
            text: text,
            textColor: foreground,
          ),
            style: ElevatedButton.styleFrom(
                backgroundColor: background,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(30),
                )),
          )),
    );
  }
}

class CustomTextFormField extends StatelessWidget {

  final String? labelText;
  final Widget? label;
  final String? hintText;
  final TextEditingController? controller;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? filled;
  final EdgeInsets? contentPadding;
  final bool border;
  final String? prefixText;
  final String? suffixText;
  final bool autofocus;
  final BorderRadius? borderRadius;
  final Color borderColor;
  final double borderThickness;
  final Color focusedBorderColor;
  final bool obscureText;
  final double focusedBorderThickness;
  final BorderRadius focusedBorderRadius;
  final Color hintTextColor;
  final Color insideTextColor;

  CustomTextFormField({
    this.fillColor,
    this.label,
    this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    required this.obscureText,
    this.contentPadding,
    this.filled,
    this.prefixIcon,
    this.suffixIcon,
    this.border = false,
    this.prefixText,
    this.suffixText,
    this.autofocus = false,
    this.borderRadius,
    this.borderThickness = 4,
    this.borderColor = Colors.transparent,
    this.focusedBorderColor = Colors.transparent,
    this.focusedBorderThickness = 4,
    this.focusedBorderRadius = BorderRadius.zero,
    this.hintTextColor = Colors.black54,
    this.insideTextColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: TextStyle(
        color: insideTextColor,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        label: label,
        hintText: hintText,
        fillColor: fillColor,
        filled: filled,
        hintStyle: TextStyle(
          color: hintTextColor
        ),
        contentPadding: contentPadding,
        border: border? OutlineInputBorder(
            borderRadius: borderRadius?? BorderRadius.zero,
            borderSide: BorderSide(
              width: borderThickness,
              color: borderColor,
            )

        ): InputBorder.none,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        suffixText: suffixText,
        focusedBorder: OutlineInputBorder(
          borderRadius: focusedBorderRadius,
          borderSide: BorderSide(
            width: focusedBorderThickness,
            color: focusedBorderColor,
          )
        )

      ),
      controller: controller,
      validator: validator,
      autofocus: autofocus,
      // Use the validation function here
    );
  }
}

class CommentTile extends StatelessWidget {

  String name;
  String comments;

  CommentTile({
   required this.name,
   required this.comments,
});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,top: 5,bottom: 5,right: 50),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListTile(
            leading: CircleAvatar(backgroundColor: primaryColor,),
              title: CustomText(
                text: name,
              ),
              subtitle: CustomText(
                text: comments,
                textSize: 13,
                textColor: Colors.grey.shade700,
              ),
          ),
        ),
      ),
    );
  }
}

