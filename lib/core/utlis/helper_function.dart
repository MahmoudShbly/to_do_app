  import 'package:flutter/material.dart' ;

void showSnackBar(BuildContext context, String text, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      SnackBar(
      content:Text(text,style: TextStyle(color: Colors.white),),
      backgroundColor: color,
      duration: Duration(seconds: 2),
    ));
  }