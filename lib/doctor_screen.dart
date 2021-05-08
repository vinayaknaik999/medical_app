import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/config.dart';
import 'package:medical_app/doctor_calender.dart';
import 'package:medical_app/login.dart';

class DoctorScreen extends StatefulWidget {
  final String username;
  final DateTime date;

  const DoctorScreen({Key key, this.username, this.date}) : super(key: key);
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final databaseReference = FirebaseDatabase.instance.reference();
  List<Appointment> dataList = [];

  @override
  void initState() {
    getDataFromServer();
    super.initState();
  }

  getDataFromServer() {
    databaseReference.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values =
          new Map<String, dynamic>.from(snapshot.value);
      values.forEach((key, values) {
        print(values);
      });
    });
  }

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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DoctorCalender()));
                    },
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Patient Name"),
                                Spacer(),
                                Text("2021-04-02"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Details"),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DoctorCalender()));
                    },
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Patient Name"),
                                Spacer(),
                                Text("2021-04-04"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Details"),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
