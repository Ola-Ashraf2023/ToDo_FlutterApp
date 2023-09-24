import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/theme_provider.dart';
import 'package:to_do/shared/styles/colors.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    String langValue = "English".tr();
    String themeValue = "Light".tr();
    var langs = ["English".tr(), "Arabic".tr()];
    var themes = ["Light".tr(), "Dark".tr()];
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
              "Settings".tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "Language".tr(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: provider.mode == ThemeMode.light
                            ? MyColors.lighterBlack
                            : MyColors.whiteColor),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  decoration: BoxDecoration(
                      color: provider.mode == ThemeMode.light
                          ? Colors.white
                          : MyColors.bottomAppBarDark,
                      border: Border.all(color: MyColors.appBarColor)),
                  child: DropdownButtonFormField(
                      dropdownColor: provider.mode == ThemeMode.light
                          ? Colors.white
                          : MyColors.bottomAppBarDark,
                      style: TextStyle(
                          color: MyColors.appBarColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      value: langValue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: langs.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(items).tr(),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newVal) {
                        if (newVal == "English".tr()) {
                          EasyLocalization.of(context)!.setLocale(Locale("en"));
                        } else if (newVal == "Arabic".tr()) {
                          EasyLocalization.of(context)!.setLocale(Locale("ar"));
                        }
                        setState(() {
                          langValue = newVal!;
                        });
                      }),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "Mode".tr(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: provider.mode == ThemeMode.light
                            ? MyColors.lighterBlack
                            : MyColors.whiteColor),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  decoration: BoxDecoration(
                      color: provider.mode == ThemeMode.light
                          ? Colors.white
                          : MyColors.bottomAppBarDark,
                      border: Border.all(color: MyColors.appBarColor)),
                  child: DropdownButtonFormField(
                      dropdownColor: provider.mode == ThemeMode.light
                          ? Colors.white
                          : MyColors.bottomAppBarDark,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // Add other desired style properties here
                      ),
                      style: TextStyle(
                          color: MyColors.appBarColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      value: themeValue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: themes.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(items).tr(),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue == "Light".tr()) {
                          provider.changeTheme(ThemeMode.light);
                        } else if (newValue == "Dark".tr()) {
                          provider.changeTheme(ThemeMode.dark);
                        }
                        setState(() {
                          themeValue = newValue!;
                        });
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
