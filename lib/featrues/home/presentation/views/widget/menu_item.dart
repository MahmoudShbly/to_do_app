import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.label, required this.icon});
  final String label ;
  final IconData icon ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [Text(label), Spacer(), Icon(icon, size: 16)],
    );
  }
}
