import 'package:app_template/provider/home_layout_provider.dart';
import 'package:app_template/screens/widget/add_task/add_note_modalSheet.dart';
import 'package:app_template/screens/note_screen.dart';
import 'package:app_template/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home Screen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeLayoutProvider(),
      builder: (context, child) {
        var provider = Provider.of<HomeLayoutProvider>(context);
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
              currentIndex: provider.selectedItem,
              onTap: (value) {
              provider.changeIndex(value);
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
             provider.showAddTask(context);
            },
            child: Icon(
              Icons.add,
              size: 30,
            ),
          ),
          body: provider.screensWidget[provider.selectedItem],
        );
      },
    );
  }


}
