import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/shared/styles/colors.dart';

class TaskSheet extends StatefulWidget {
  const TaskSheet({super.key});

  @override
  State<TaskSheet> createState() => _TaskSheetState();
}

class _TaskSheetState extends State<TaskSheet> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Add new Task",
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
          ).tr(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: taskController,
            style: TextStyle(),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyColors.appBarColor,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              hintText: "enter your task".tr(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Select Time",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            ).tr(),
          ),
        ),
        InkWell(
            onTap: () {
              selectDate();
            },
            child: Text(
              "${selectedDate.toString().substring(0, 10)}",
              style: TextStyle(color: MyColors.appBarColor, fontSize: 16),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 40),
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add Task",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18),
              ),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.appBarColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        )
      ],
    );
  }

  selectDate() async {
    DateTime? newDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: MyColors.appBarColor,
                  onPrimary: MyColors.whiteColor,
                  //onSurface: Colors.red
                ),
                //primaryColor: MyColors.appBarColor,

                // primaryColor: MyColors.appBarColor,
              ),
              child: child!);
        },
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now().subtract(Duration(days: 20)),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (newDate == null) {
      return;
    }
    selectedDate = newDate;
    setState(() {});
  }
}
