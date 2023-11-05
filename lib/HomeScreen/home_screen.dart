import 'package:chat_app/CommentsScreen/comments_screen.dart';
import 'package:chat_app/Widgets/widgets_classes.dart';
import 'package:chat_app/variables.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var messageText = [
    "Hi, I am Shakir",
    "Hi, I am Faraz",
    "What are you doing?",
    "I was a little bit busy today",
    "I will talk to you later when will you free or you can call me anytime",
    "Hi, I am Shakir",
    "Hi, I am Faraz",
    "What are you doing?",
    "I was a little bit busy today",
    "I will talk to you later when will you free or you can call me anytime",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: secondaryColor
          ),
          title: CustomText(
            text: "Home",
            textSize: 17,
          ),
          backgroundColor: primaryColor,
        ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 70),
            child: Expanded(
              child: ListView.builder(
                  itemCount: messageText.length,
                  itemBuilder: (context,index){
                return Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CommentsScreen(messageText: messageText[index].toString())));
                      },
                      child: BubbleSpecialThree(
                        text: messageText[index].toString(),
                        color: Colors.grey.shade300,
                        textStyle: TextStyle(
                            color: secondaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                );
              }),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MessageBar(
              messageBarColor: Colors.grey.shade400,
              sendButtonColor: secondaryColor,
              onSend: (_) => print(_),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade400
                    ),
                    child: InkWell(
                      child: Icon(
                        Icons.camera_alt,
                        color: secondaryColor,
                        size: 24,
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


