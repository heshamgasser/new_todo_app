import 'package:app_template/provider/app_provider.dart';
import 'package:app_template/screens/widget/setting/language_sheet.dart';
import 'package:app_template/screens/widget/setting/setting_menu.dart';
import 'package:app_template/screens/widget/setting/theme_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  bool on = true;

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 15),
          SettingMenuContainer(
            text: settingProvider.language == 'en'
                ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic,
            widgetFunction: LanguageSheetWidget(),
          ),
          SizedBox(height: 15),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 15),
          SettingMenuContainer(
            text: settingProvider.themeMode == ThemeMode.light
                ? AppLocalizations.of(context)!.light
                : AppLocalizations.of(context)!.dark,
            widgetFunction: ThemeSheetWidget(),
          ),
        ],
      ),
    );
  }
}
