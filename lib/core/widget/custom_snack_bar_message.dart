import 'package:flutter/material.dart';

class CustomSnackBarMessage extends StatelessWidget {
  const CustomSnackBarMessage({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: Colors.white),);
  }
}