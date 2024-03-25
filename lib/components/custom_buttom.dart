import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text,this.color , this.onTap ,this.colorText});
  String? text;
  Color? color;
  Color? colorText;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(color: colorText),
          ),
        ),
      ),
    );
  }
}
