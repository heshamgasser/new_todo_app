import 'package:app_template/provider/date_time_provider.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  DateTime date = DateUtils.dateOnly(DateTime.now());
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
                monthColor: Theme
                    .of(context)
                    .colorScheme
                    .onSurface,
                activeBackgroundDayColor: Theme
                    .of(context)
                    .primaryColor,
                locale: 'en',
                initialDate: date,
                firstDate: date.subtract(
                  Duration(days: 30),
                ),
                lastDate: date.add(
                  Duration(days: 30),
                ),
                onDateSelected: (p0) {
                  selectedDate = p0;
                },
              ),
              SizedBox(height: 20),
              ListTile(
                horizontalTitleGap: 15,
                tileColor: Theme
                    .of(context)
                    .colorScheme
                    .background,
                contentPadding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onSurface),
                ),
                title: Text(
                  'Hesham gasser',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'This is My Task',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.time,
                          size: 20,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onSurface,
                        ),
                        SizedBox(width: 10),
                        Text(
                          pro.initialTime.format(context).toString(),
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                isThreeLine: true,
                leading: VerticalDivider(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  thickness: 3,
                ),
                trailing: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .2,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .05,
                  decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .surface,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
