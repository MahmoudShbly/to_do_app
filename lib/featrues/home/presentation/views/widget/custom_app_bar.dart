import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app_with_api/core/utlis/my_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      SvgPicture.asset(MyAssets.logo),
      GestureDetector(child: SvgPicture.asset(MyAssets.icon),onTap: (){},),
      ],
    );
  }
}