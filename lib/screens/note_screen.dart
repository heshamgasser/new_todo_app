import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ListTile(
            horizontalTitleGap: 15,
            tileColor: Theme.of(context).colorScheme.background,
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Theme.of(context).colorScheme.onSurface),
            ),
            title: Text(
              'Hesham gasser',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              'This is My Task',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            isThreeLine: true,
            leading: VerticalDivider(
              color: Theme.of(context).primaryColor,
              thickness: 3,
            ),
            trailing: Container(
              width: MediaQuery.of(context).size.width * .2,
              height: MediaQuery.of(context).size.height * .05,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle),
              child: Icon(
                Icons.done,
                size: 30,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
