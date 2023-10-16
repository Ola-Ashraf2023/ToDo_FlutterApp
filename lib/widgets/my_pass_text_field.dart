import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyPassTextField extends StatelessWidget {
  String hint;
  TextEditingController myController = TextEditingController();

  MyPassTextField(this.hint, this.myController);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password'.tr();
        }
        if (value.length < 8) {
          return 'Password is too short'.tr();
        }
        return null;
      },
      obscureText: true,
      controller: myController,
      decoration: InputDecoration(
          hintText: hint.tr(),
          contentPadding: EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
