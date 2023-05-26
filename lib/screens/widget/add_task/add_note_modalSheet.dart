import 'package:app_template/screens/widget/add_task/custom_elevatedButton.dart';
import 'package:app_template/screens/widget/add_task/custom_textFormField.dart';
import 'package:flutter/material.dart';

class AddNotes extends StatelessWidget {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add Task',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Divider(
              color: Theme.of(context).colorScheme.onBackground,
              indent: MediaQuery.of(context).size.width * .4,
              endIndent: MediaQuery.of(context).size.width * .4,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
                hint: 'Enter Your Task', controller: taskController),
            SizedBox(height: 10),
            CustomTextFormField(
                hint: 'Task Description',
                maxLines: 5,
                controller: descriptionController),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(backgroundColor: Theme.of(context).primaryColor, buttonText: 'Add')
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: CustomElevatedButton(backgroundColor: Theme.of(context).colorScheme.error, buttonText: 'Cancel')
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
