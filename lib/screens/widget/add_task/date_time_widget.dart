import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {
  String childText;
  Function onTapped;
  bool checkColor;

  DateTimeWidget(
      {required this.childText,
      required this.onTapped,
      this.checkColor = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapped();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
              color: checkColor
                  ? Colors.grey
                  : Theme.of(context).colorScheme.onSurface),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            childText,
            style: checkColor
                ? Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey)
                : Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
