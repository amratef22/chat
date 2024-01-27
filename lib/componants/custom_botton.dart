import 'package:chaty_app/componants/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({ required this.text, this.onTab});


String text;
VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTab,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10,),
        ),
        child:  Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
