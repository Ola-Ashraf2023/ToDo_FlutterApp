import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do/screens/tasks/task_item.dart';
import 'package:to_do/shared/styles/colors.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 20)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: MyColors.lighterBlack,
          //dark mode Color(0xffffffff)
          dayColor: MyColors.lighterBlack,
          //dark mode Color(0xffffffff)
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
