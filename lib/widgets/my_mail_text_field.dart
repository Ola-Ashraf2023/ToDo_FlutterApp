import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyMailTextField extends StatelessWidget {
  String hint;
  TextEditingController myController = TextEditingController();

  MyMailTextField(this.hint, this.myController);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? myString) {
        if (myString == null || myString.isEmpty) {
          return 'Please enter your email'.tr();
        }
        final bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(myString);
        if (!emailValid) {
          return 'Please enter a valid email'.tr();
        }
        return null;
      },
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
