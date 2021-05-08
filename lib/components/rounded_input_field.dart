import 'package:flutter/material.dart';
import 'package:medical_app/components/constants.dart';
import 'package:medical_app/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final String value;
  final bool enabled;
  final int maxLines;
  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.value,
      this.enabled,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        initialValue: (value != null) ? value : "",
        enabled: (enabled != null) ? enabled : true,
        maxLines: (maxLines != null) ? maxLines : 1,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
