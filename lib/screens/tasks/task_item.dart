import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/providers/my_provider.dart';
import 'package:to_do/screens/tasks/edit_task.dart';
import 'package:to_do/shared/network/firebase/firebase_manager.dart';
import 'package:to_do/shared/styles/colors.dart';

class MyTask extends StatelessWidget {
  TaskModel taskModel;

  MyTask(this.taskModel, {super.key});

  @override
  Widget build(BuildContext context) {
    // var dt = DateTime.fromMillisecondsSinceEpoch(taskModel.date);
    // var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    // print(date);
    var provider = Provider.of<MyProvider>(context);
    return Card(
      color: provider.mode == ThemeMode.light
          ? Colors.white
          : MyColors.bottomAppBarDark,
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
              onPressed: (context) {
                FirebaseManager.deleteTask(taskModel.id);
              },
              backgroundColor: MyColors.deleteRed,
              label: "Delete",
              icon: Icons.delete,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12))),
          SlidableAction(
            onPressed: (context) {
              Navigator.pushNamed(context, EditTask.routeName,
                  arguments: TaskModel(
                      userId: FirebaseAuth.instance.currentUser!.uid,
                      title: taskModel.title,
                      date: taskModel.date,
                      time: taskModel.time,
                      id: taskModel.id,
                      isDone: taskModel.isDone));
            },
            label: "Edit",
            backgroundColor: Colors.green,
            icon: Icons.edit,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
          )
        ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: EasyLocalization.of(context)!.currentLocale ==
                          Locale("en")
                      ? Border(
                          left:
                              BorderSide(color: MyColors.appBarColor, width: 5))
                      : Border(
                          right: BorderSide(
                              color: MyColors.appBarColor, width: 5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        taskModel.title,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 18,
                                color: MyColors.appBarColor,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 12, left: 12, right: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: MyColors.lighterBlack,
                          ),
                          Text(taskModel.time.toString(),
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      FirebaseManager.updateDone(taskModel.id, true);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: taskModel.isDone
                                ? MyColors.doneGreen
                                : MyColors.appBarColor,
                            borderRadius: BorderRadius.circular(12)),
                        margin: EdgeInsets.only(right: 16),
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 6, bottom: 6),
                        child: taskModel.isDone
                            ? Text(
                                "Done!".tr(),
                                style: TextStyle(
                                    color: MyColors.whiteColor, fontSize: 15),
                              )
                            : Icon(
                                Icons.check,
                                color: Colors.white,
                              )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
