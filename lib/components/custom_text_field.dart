import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  CustomField({required this.hint, this.onChange, this.obsecure = false,this.inputType});
  String? hint;
  Function(String)? onChange;
  bool? obsecure;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextFormField(
        obscureText: obsecure!,
        keyboardType: inputType,
        // validator: (data) { // 
        //   if (data!.isEmpty) {
        //     return "Value Is Wrong";
        //   }
        // },
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}