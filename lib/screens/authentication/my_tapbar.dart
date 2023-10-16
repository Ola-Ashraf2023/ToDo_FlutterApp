import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/screens/authentication/login.dart';
import 'package:to_do/screens/authentication/signup.dart';

class LoginBar extends StatelessWidget {
  static const String routeName = "login";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text("To Do List").tr(),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Login".tr(),
                  ),
                  Tab(
                    text: "Sign up".tr(),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Login(),
                SignUp(),
              ],
            )));
  }
}
