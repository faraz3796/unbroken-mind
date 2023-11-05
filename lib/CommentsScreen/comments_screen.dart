import 'package:chat_app/Widgets/widgets_classes.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import '../variables.dart';

class CommentsScreen extends StatelessWidget {

  String messageText;

  CommentsScreen({
    required this.messageText,
});

  var nameList = [
    "Faraz",
    "Faraz",
    "Faraz",
    "Faraz",
    "Faraz",
    "Faraz",
  ];
  var commentList = [
    "Hi, I am Faraz",
    "Hi, I am Faraz",
    "Hi, I am Faraz",
    "Hi, I am Faraz",
    "Hi, I am Faraz",
    "Hi, I am Faraz",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: secondaryColor),
        title:  CustomText(
          text: "Comments",
          textSize: 17,
        ),
        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: BubbleSpecialThree(
                  text: messageText,
                  isSender: false,
                  color: primaryColor,
                  textStyle: TextStyle(
                    color: secondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                )
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Comments",
                  textSize: 18,
                  textColor: Colors.grey.shade700,
                )
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: nameList.length,
                      itemBuilder: (context,index){
                        return CommentTile(
                          name: nameList[index].toString(),
                          comments: commentList[index].toString(),
                        );
                      }
                  ),
              ),
              SizedBox(height: 70,)

            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MessageBar(
              messageBarColor: Colors.grey.shade400,
              sendButtonColor: secondaryColor,
              messageBarHitText: "Type your comment here",
              onSend: (_) => print(_),
            ),
          ),
        ],
      ),
    );
  }
}


