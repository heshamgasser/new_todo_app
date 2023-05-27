import 'package:app_template/screens/widget/setting/setting_custom_container.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Language',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 15),
          SettingCustomContainer('English'),
          SizedBox(height: 15),
          Text(
            'Theme',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 15),
          SettingCustomContainer('Light'),
        ],
      ),
    );
  }
}
