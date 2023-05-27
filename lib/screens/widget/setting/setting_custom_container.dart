import 'package:flutter/material.dart';

class SettingCustomContainer extends StatelessWidget {
  String text;

  SettingCustomContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapped(context);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            Spacer(),
            Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }

  void onTapped(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'English',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  Spacer(),
                  Icon(
                    Icons.done,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    'Arabic',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  Spacer(),
                  Icon(
                    Icons.done,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
