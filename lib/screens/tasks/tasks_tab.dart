import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/theme_provider.dart';
import 'package:to_do/screens/tasks/task_item.dart';
import 'package:to_do/shared/styles/colors.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 20)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: provider.mode == ThemeMode.light
              ? MyColors.lighterBlack
              : Colors.white,
          dayColor: provider.mode == ThemeMode.light
              ? MyColors.lighterBlack
              : Colors.white,
          activeDayColor: MyColors.whiteColor,
          activeBackgroundDayColor: MyColors.appBarColor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return MyTask();
              },
            ))
      ],
    );
  }
}
