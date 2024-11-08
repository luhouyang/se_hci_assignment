import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management/widgets/ui_color.dart';

class TextInputs {
  emailVerify(value) {
    return EmailValidator.validate(value ?? "") ? null : "Please enter a valid email";
  }

  passwordVerify(value) {
    return (value == null || value.isEmpty || value.length < 6) ? "Please enter password of at least 6 length" : null;
  }

  usernameVerify(value) {
    return (value == null || value.isEmpty) ? "Please enter a valid username" : null;
  }

  Widget inputTextWidget({required String hint, required Function validator, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUnfocus,
        validator: (value) => validator(value),
        controller: controller,
        style: TextStyle(color: UIColor().primaryBlue),
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }

  Widget obscureInputTextWidget(
      {required String hint,
      required Function validator,
      required TextEditingController controller,
      required Function getFunc,
      required Function setFunc}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: TextFormField(
        obscureText: getFunc(),
        autovalidateMode: AutovalidateMode.onUnfocus,
        validator: (value) => validator(value),
        controller: controller,
        style: TextStyle(color: UIColor().primaryBlue),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              getFunc() ? Icons.visibility : Icons.visibility_off,
              color: UIColor().primaryBlue,
            ),
            onPressed: () {
              setFunc();
            },
          ),
          hintText: hint,
        ),
      ),
    );
  }
}
