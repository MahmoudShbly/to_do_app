import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonName,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.frontgroundColor = Colors.black,
 
  });
 
  final String buttonName;
  final Color backgroundColor;
  final Color frontgroundColor;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(buttonName, style: TextStyle(color: frontgroundColor)),
        ),
      ),
    );
  }
}
