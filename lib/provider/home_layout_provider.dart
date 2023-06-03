import 'package:flutter/material.dart';

import '../screens/note_screen.dart';
import '../screens/setting_screen.dart';
import '../screens/widget/add_task/add_note_modalSheet.dart';

class HomeLayoutProvider extends ChangeNotifier {
  int selectedItem = 0;
  List<Widget> screensWidget = [NotesScreen(), SettingScreen()];

  void changeIndex(int value) {
    selectedItem = value;
    notifyListeners();
  }

  void showAddTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      context: context,
      builder: (context) {
        return AddNotes();
      },
    );
    notifyListeners();
  }
}
