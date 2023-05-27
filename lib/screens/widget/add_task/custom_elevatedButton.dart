import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  Color backgroundColor;
  String buttonText;
  Function onTapped;


  CustomElevatedButton({required this.backgroundColor,required this.buttonText, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: backgroundColor),
      onPressed: () {
        onTapped();
      },
      child:
      Text(
        buttonText,
        style: Theme.of(context).textTheme.bodyMedium,
      ),


    );
  }
}
