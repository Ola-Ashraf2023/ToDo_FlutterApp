import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/layout/home.dart';
import 'package:to_do/providers/my_provider.dart';
import 'package:to_do/shared/network/firebase/firebase_manager.dart';
import 'package:to_do/widgets/my_mail_text_field.dart';
import 'package:to_do/widgets/my_pass_text_field.dart';

import '../../shared/styles/colors.dart';

class Login extends StatelessWidget {
  @override
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                MyMailTextField("Please enter your email", emailController),
                SizedBox(
                  height: 30,
                ),
                MyPassTextField("Please enter a password", passController),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (!_formkey.currentState!.validate()) {
                          return;
                        }
                        FirebaseManager.login(
                            emailController.text, passController.text, () {
                          provider.initUser();
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomeScreen.routeName, (route) => false);
                        }, (message) {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Error"),
                                content: Text(message.toString()),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Done!".tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 18),
                                        ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        MyColors.appBarColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(12))),
                                  )
                                ],
                              ));
                        });
                      },
                      child: Text(
                        "Login".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.appBarColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
