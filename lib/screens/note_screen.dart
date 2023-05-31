import 'package:app_template/models/task_model.dart';
import 'package:app_template/provider/date_time_provider.dart';
import 'package:app_template/screens/widget/add_task/task_item.dart';
import 'package:app_template/shared/network/firebase/firebase_function.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DateTimeProvider(),
      builder: (context, child) {
        var pro = Provider.of<DateTimeProvider>(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CalendarTimeline(
                monthColor: Theme.of(context).colorScheme.onSurface,
                activeBackgroundDayColor: Theme.of(context).primaryColor,
                locale: 'en',
                initialDate: selectedDate,
                firstDate: selectedDate.subtract(
                  Duration(days: 30),
                ),
                lastDate: selectedDate.add(
                  Duration(days: 30),
                ),
                onDateSelected: (p0) {
                  setState(() {
                    selectedDate = p0;
                  });
                },
              ),
              SizedBox(height: 20),
              StreamBuilder(
                stream: FirebaseFunctions.getTasksFromFirebase(selectedDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        AppLocalizations.of(context)!.wrongMessage,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    );
                  }
                  List<TaskModel> tasks =
                      snapshot.data?.docs.map((doc) => doc.data()).toList() ??
                          [];
                  return tasks.isEmpty
                      ? Center(
                          child: Text(
                            AppLocalizations.of(context)!.noTasks,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return TaskItem(
                                  tasks[index],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10),
                              itemCount: tasks.length),
                        );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
