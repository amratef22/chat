import 'package:chaty_app/componants/constants.dart';
import 'package:chaty_app/models/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key, required this.messageModel,
  });

  final Message messageModel ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 16,
          bottom: 16,
          right: 16,
        ),
        margin: const EdgeInsets.all(9),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child:  Text(
          messageModel.message,
          style: const TextStyle(
            color: CupertinoColors.white,
          ),
        ),
      ),
    );
  }
}

class ChatBubleFriend extends StatelessWidget {
  const ChatBubleFriend({
    super.key, required this.messageModel,
  });

  final Message messageModel ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 16,
          bottom: 16,
          right: 16,
        ),
        margin: const EdgeInsets.all(9),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: Colors.black54,
        ),
        child:  Text(
          messageModel.message,
          style: const TextStyle(
            color: CupertinoColors.white,
          ),
        ),
      ),
    );
  }
}