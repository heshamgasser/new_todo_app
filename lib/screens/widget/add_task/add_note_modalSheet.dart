import 'package:app_template/provider/date_time_provider.dart';
import 'package:app_template/screens/widget/add_task/custom_elevatedButton.dart';
import 'package:app_template/screens/widget/add_task/custom_textFormField.dart';
import 'package:app_template/screens/widget/add_task/date_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AddNotes extends StatefulWidget {
  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DateTimeProvider(),
      builder: (context, child) {
        var dateTimeProvider = Provider.of<DateTimeProvider>(context);
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.addTask,
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
                CustomTextFormField(
                    hint: AppLocalizations.of(context)!.taskTitle,
                    controller: taskController),
                SizedBox(height: 10),
                CustomTextFormField(
                    hint: AppLocalizations.of(context)!.taskDetail,
                    maxLines: 5,
                    controller: descriptionController),
                SizedBox(height: 10),
                Text(AppLocalizations.of(context)!.taskDateTime,
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DateTimeWidget(
                        childText:
                            dateTimeProvider.date.toString().substring(0, 10),
                        onTapped: () {
                          dateTimeProvider.onDateTapped(context);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DateTimeWidget(
                        childText: dateTimeProvider.initialTime
                            .format(context)
                            .toString(),
                        onTapped: () {
                          dateTimeProvider.onTimeTapped(context);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        backgroundColor: Theme.of(context).primaryColor,
                        buttonText: AppLocalizations.of(context)!.add,
                        onTapped: () {
                          if (formKey.currentState!.validate()) {}
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
                    )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
