import 'package:app_template/models/task_model.dart';
import 'package:app_template/shared/network/firebase/firebase_function.dart';
import 'package:app_template/shared/style/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;

  TaskItem(this.taskModel);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        // dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            onPressed: (context) {
              FirebaseFunctions.deleteFromFirebase(taskModel.id);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            onPressed: (context) {
              //TODO: making new screen for update and adding firebase Function to ok button
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Update',
          ),
        ],
      ),
      child: ListTile(
        horizontalTitleGap: 15,
        tileColor: Theme.of(context).colorScheme.background,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Theme.of(context).colorScheme.onSurface),
        ),
        title: Text(
          taskModel.title,
          style: taskModel.status
              ? Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: greenColor)
              : Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              taskModel.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  CupertinoIcons.time,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                SizedBox(width: 10),
                Text(
                  taskModel.time,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
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
              color: taskModel.status
                  ? Colors.transparent
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle),
          child: taskModel.status
              ? Center(
                  child: Text(
                  'Done!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: greenColor),
                ))
              : Icon(
                  Icons.done,
                  size: 30,
                  color: Theme.of(context).colorScheme.surface,
                ),
        ),
      ),
    );
  }
}
