import 'package:app_template/screens/widget/add_task/add_note_modalSheet.dart';
import 'package:app_template/screens/note_screen.dart';
import 'package:app_template/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;


  List<Widget> screensWidget = [SettingScreen(), NotesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        padding: EdgeInsets.all(0),
        elevation: 0,
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedItem,
          onTap: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: ''),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        shape: StadiumBorder(
          side: BorderSide(color: Colors.white, width: 3),
        ),
        onPressed: () {
          showAddTask();
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: screensWidget[selectedItem],
    );
  }

  void showAddTask() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      context: context,
      builder: (context) {
        return AddNotes();
      },
    );
  }
}
