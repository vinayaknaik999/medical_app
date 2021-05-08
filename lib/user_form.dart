import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medical_app/components/rounded_button.dart';
import 'package:medical_app/components/rounded_input_field.dart';

class UserForm extends StatefulWidget {
  final String username;
  final DateTime date;

  const UserForm({Key key, this.username, this.date}) : super(key: key);
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final databaseReference = FirebaseDatabase.instance.reference();
  String details = "";
  String username = "";
  String date = "";
  bool loading = false;

  @override
  void initState() {
    username = widget.username;
    date = widget.date.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MEDI APP"),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                RoundedInputField(
                  hintText: "Username",
                  value: username,
                  enabled: false,
                  onChanged: (value) {
                    username = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RoundedInputField(
                  hintText: "Date",
                  value: date,
                  enabled: false,
                  icon: Icons.calendar_today,
                  onChanged: (value) {
                    username = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RoundedInputField(
                  hintText: "Details",
                  maxLines: 3,
                  icon: Icons.format_align_center,
                  onChanged: (value) {
                    details = value;
                  },
                ),
                (loading)
                    ? CircularProgressIndicator()
                    : RoundedButton(
                        text: "SUBMIT",
                        press: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          createRecord();
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createRecord() {
    databaseReference.push().set({
      'username': username,
      'date': date,
      'description': details,
      "type": "appointment"
    });

    Fluttertoast.showToast(
        msg: "Submitted successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }
}
