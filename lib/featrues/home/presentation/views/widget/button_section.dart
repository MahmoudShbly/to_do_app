import 'package:flutter/material.dart';
import 'package:todo_app_with_api/core/widget/custom_button.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    super.key,
    this.formKey, this.onPressed,
  });
  final GlobalKey<FormState>? formKey;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomButton(
          buttonName: 'Cancel',
          frontgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Spacer(),
        CustomButton(
          buttonName: ' Add ',
          backgroundColor: Colors.black,
          frontgroundColor: Colors.white,
          onPressed: () { 
            if(formKey!.currentState!.validate()){
              onPressed!();
            }
            
          },
        ),
      ],
    );
  }
}