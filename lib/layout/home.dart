import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/screens/tasks/tasks_tab.dart';
import 'package:to_do/shared/styles/colors.dart';
import 'package:to_do/task_bottom_sheet.dart';

import '../screens/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> Tabs = [Tasks(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("To Do List".tr(),
            style: Theme.of(context).textTheme.bodyLarge),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.appBarColor,
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 3)),
        onPressed: () {
          showTaskBottomSheet();
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 12,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
        ),
      ),
      body: Tabs[index],
    );
  }

  showTaskBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            borderSide: BorderSide(color: Colors.transparent)),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TaskSheet(),
          );
        });
  }
}
