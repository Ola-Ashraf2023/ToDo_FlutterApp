import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class Login extends StatelessWidget {
  @override
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Widget build(BuildContext context) {
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
                TextFormField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter your email",
                      contentPadding: EdgeInsets.all(20),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  controller: passController,
                  decoration: InputDecoration(
                      hintText: "Enter your password here",
                      contentPadding: EdgeInsets.all(20),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
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
                      },
                      child: Text(
                        "Login",
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
