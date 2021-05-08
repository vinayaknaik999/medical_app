import 'package:flutter/material.dart';
import 'package:medical_app/components/constants.dart';
import 'package:medical_app/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final Widget suffix;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.obscureText,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: obscureText,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: suffix,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
