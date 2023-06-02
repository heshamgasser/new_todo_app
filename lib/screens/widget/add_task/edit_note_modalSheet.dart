import 'package:app_template/screens/widget/add_task/custom_edit_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../models/task_model.dart';
import '../../../provider/date_time_provider.dart';
import '../../../shared/network/firebase/firebase_function.dart';
import 'custom_elevatedButton.dart';
import 'date_time_widget.dart';

class EditTaskModalSheet extends StatefulWidget {
  TaskModel taskModel;

  EditTaskModalSheet(this.taskModel);

  @override
  State<EditTaskModalSheet> createState() => _EditTaskModalSheetState();
}

class _EditTaskModalSheetState extends State<EditTaskModalSheet> {
  TextEditingController taskTitleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  bool status = false;
  bool active = false;

  final GlobalKey<FormState> editFormKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    taskTitleController.text = widget.taskModel.title;
    descriptionController.text = widget.taskModel.description;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DateTimeProvider(),
      builder: (context, child) {
        var dateTimeProvider = Provider.of<DateTimeProvider>(context);
        return Form(
          key: editFormKey,
          child: Padding(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.editTask,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    color: Theme.of(context).colorScheme.onBackground,
                    indent: MediaQuery.of(context).size.width * .35,
                    endIndent: MediaQuery.of(context).size.width * .35,
                  ),
                  SizedBox(height: 10),
                  CustomEditTextFormField(
                    hint: AppLocalizations.of(context)!.taskTitle,
                    controller: taskTitleController,
                  ),
                  SizedBox(height: 10),
                  CustomEditTextFormField(
                    hint: AppLocalizations.of(context)!.taskDetail,
                    maxLines: 5,
                    controller: descriptionController,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Switch(
                        activeColor: Theme.of(context).primaryColor,
                        value: active,
                        onChanged: (value) {
                          setState(() {
                            active = value;
                            print(active);
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      Text(
                        AppLocalizations.of(context)!.updateDateTime,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(AppLocalizations.of(context)!.taskDateTime,
                      style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(
                    height: 10,
                  ),
                  AbsorbPointer(
                    absorbing: !active,
                    child: Row(
                      children: [
                        Expanded(
                          child: DateTimeWidget(
                            childText: active == false
                                ? widget.taskModel.date
                                : dateTimeProvider.date
                                    .toString()
                                    .substring(0, 10),
                            onTapped: () {
                              dateTimeProvider.onDateTapped(context);
                            },
                            checkColor: !active,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: DateTimeWidget(
                            childText: active == false
                                ? widget.taskModel.time
                                : dateTimeProvider.initialTime
                                    .format(context)
                                    .toString(),
                            onTapped: () {
                              dateTimeProvider.onTimeTapped(context);
                            },
                            checkColor: !active,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          backgroundColor: Theme.of(context).primaryColor,
                          buttonText: AppLocalizations.of(context)!.update,
                          onTapped: () {
                            if (editFormKey.currentState!.validate()) {
                              TaskModel updatedTask = TaskModel(
                                  id: widget.taskModel.id,
                                  title: taskTitleController.text,
                                  description: descriptionController.text,
                                  date: active == false
                                      ? widget.taskModel.date
                                      : dateTimeProvider.date
                                          .toString()
                                          .substring(0, 10),
                                  time: active == false
                                      ? widget.taskModel.time
                                      : dateTimeProvider.initialTime
                                          .format(context)
                                          .toString(),
                                  status: status);
                              FirebaseFunctions.updateTask(
                                  widget.taskModel.id, updatedTask);
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomElevatedButton(
                          backgroundColor: Theme.of(context).colorScheme.error,
                          buttonText: AppLocalizations.of(context)!.cancel,
                          onTapped: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
