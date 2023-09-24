import 'package:flutter/material.dart';
import 'package:to_do/shared/styles/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    String langValue = "English";
    String themeValue = "Light";
    var langs = ["English", "Arabic"];
    var themes = ["Light", "dark"];
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: MyColors.appBarColor,
            ),
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Settings",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          // Row(children:[Text("Settings"),]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "Language",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButtonFormField(
                    value: langValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: langs.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        langValue = newVal!;
                      });
                    }),
              ),
              Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "Mode",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: MyColors.deleteRed, width: 1))
                        //borderSide: BorderSide(color: MyColors.appBarColor)
                        ),
                    value: themeValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: themes.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        themeValue = newValue!;
                      });
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
