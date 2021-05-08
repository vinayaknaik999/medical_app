import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/components/constants.dart';
import 'package:medical_app/components/rounded_button.dart';
import 'package:medical_app/components/rounded_input_field.dart';
import 'package:medical_app/components/rounded_password_field.dart';
import 'package:medical_app/doctor_screen.dart';
import 'package:medical_app/user_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  String password = "";
  String username = "";
  bool loading = false;
  bool isDoctor = false;
  bool isUser = true;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Medical App",
                style: GoogleFonts.montserrat(
                    textStyle: boldHeadingStyle, fontSize: 24),
              ),
              SizedBox(
                height: 50,
              ),
              RoundedInputField(
                hintText: "Username",
                onChanged: (value) {
                  username = value;
                },
              ),
              RoundedPasswordField(
                obscureText: _isHidden,
                suffix: InkWell(
                  onTap: _togglePasswordView,
                  child: _isHidden
                      ? Icon(
                          Icons.visibility,
                          color: kPrimaryColor,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: kPrimaryColor,
                        ),
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: isUser,
                      onChanged: (bool value) {
                        setState(() {
                          isDoctor = false;
                          isUser = true;
                        });
                      },
                    ),
                    Text("User"),
                    SizedBox(
                      width: 20,
                    ),
                    Checkbox(
                      value: isDoctor,
                      onChanged: (bool value) {
                        setState(() {
                          isUser = false;
                          isDoctor = true;
                        });
                      },
                    ),
                    Text("Doctor")
                  ],
                ),
              ),
              (loading)
                  ? CircularProgressIndicator()
                  : RoundedButton(
                      text: "LOGIN",
                      press: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (username != "" && password != "") {
                          makeLoginRequest();
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please fill all the fields",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }

  makeLoginRequest() {
    setState(() {
      loading = true;
    });

    Future.delayed(const Duration(milliseconds: 3000), () {
      if (isUser) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => UserScreen(
                      username: username,
                    )));
      } else if (isDoctor) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => DoctorScreen(
                      username: username,
                    )));
      }

      setState(() {
        loading = false;
      });
    });
  }
}
