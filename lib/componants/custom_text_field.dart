import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,  this.label,  this.hint, this.onChange});


 String? label;
 String? hint;
 Function(String)?onChange;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      onChanged:onChange ,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),

        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
