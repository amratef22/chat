import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key,  this.label,  this.hint, this.onChange, this.obsecure=false});


 String? label;
 String? hint;
 bool? obsecure;
 Function(String)?onChange;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obsecure!,
      validator: (data)
      {
        if(data!.isEmpty)
        {
          return  'Field is required';
        }
      },
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
