import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medical_app/components/rounded_button.dart';

class DoctorCalender extends StatefulWidget {
  @override
  _DoctorCalenderState createState() => _DoctorCalenderState();
}

class _DoctorCalenderState extends State<DoctorCalender> {
  final Map<DateTime, List<NeatCleanCalendarEvent>> _events = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MEDI APP"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Card(
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
                Expanded(
                  flex: 3,
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Calendar(
                      startOnMonday: false,
                      weekDays: [
                        'Sun',
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat'
                      ],
                      events: _events,
                      isExpanded: true,
                      eventDoneColor: Colors.green,
                      selectedColor: Colors.pink,
                      todayColor: Colors.blue,
                      onDateSelected: (value) => () {},
                      onEventSelected: (value) => print(value.description),
                      eventColor: Colors.grey,
                      expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                      dayOfWeekStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 11),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Feedback"),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Colors.grey[200],
                                  width: 2.0,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                            minLines: 4,
                            maxLines: 8,
                            maxLength: 1000,
                          ),
                          RoundedButton(
                            text: "SUBMIT",
                            press: () {
                              Fluttertoast.showToast(
                                  msg: "Submitted",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
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
      ),
    );
  }
}
