import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  Color backgroundColor;
  String buttonText;


  CustomElevatedButton({required this.backgroundColor,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor
      ),
      onPressed: () {},
      child:
      Text(
        buttonText,
        style: Theme.of(context).textTheme.bodyMedium,
      ),


    );
  }
}
