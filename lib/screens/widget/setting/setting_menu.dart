import 'package:flutter/material.dart';

class SettingMenuContainer extends StatelessWidget {
  String text;
  Widget widgetFunction;

  SettingMenuContainer(
      {super.key, required this.text, required this.widgetFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return widgetFunction;
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).colorScheme.onSurface),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }
}
