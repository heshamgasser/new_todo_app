import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../provider/app_provider.dart';

class ThemeSheetWidget extends StatelessWidget {
  ThemeSheetWidget({Key? key}) : super(key: key);
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: themeProvider.themeMode == ThemeMode.light
                      ? Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Theme.of(context).primaryColor)
                      : Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Visibility(
                  visible:
                      themeProvider.themeMode == ThemeMode.light ? true : false,
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: themeProvider.themeMode == ThemeMode.light
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.dark,
                  style: themeProvider.themeMode == ThemeMode.dark
                      ? Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Theme.of(context).primaryColor)
                      : Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Visibility(
                  visible:
                      themeProvider.themeMode == ThemeMode.dark ? true : false,
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: themeProvider.themeMode == ThemeMode.dark
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
