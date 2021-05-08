import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:medical_app/login.dart';
import 'package:medical_app/user_form.dart';

class UserScreen extends StatefulWidget {
  final String username;

  const UserScreen({Key key, this.username}) : super(key: key);
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final databaseReference = FirebaseDatabase.instance.reference();

  final Map<DateTime, List<NeatCleanCalendarEvent>> _events = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MEDI APP"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()));
              })
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Calendar(
            startOnMonday: false,
            weekDays: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
            events: _events,
            isExpanded: true,
            eventDoneColor: Colors.green,
            selectedColor: Colors.pink,
            todayColor: Colors.blue,
            onDateSelected: (value) => gotoForm(value),
            onEventSelected: (value) => print(value.description),
            eventColor: Colors.grey,
            expandableDateFormat: 'EEEE, dd. MMMM yyyy',
            dayOfWeekStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
          ),
        ),
      ),
    );
  }

  gotoForm(DateTime val) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => UserForm(
                  username: widget.username,
                  date: val,
                )));
  }
}
