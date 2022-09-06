import 'package:hello_fresh/login_password/forgot.dart';
import 'package:hello_fresh/login_password/otp.dart';
import 'package:hello_fresh/login_password/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/ctextfield.dart';
import '../utils/custombutton.dart';
import '../utils/itextfield.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 13,
            ),
            Image.asset(
              "image/cleans.png",
              height: height / 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CustomStrings.login,
                        style: TextStyle(
                            fontFamily: 'Gilroy Bold',
                            color: notifire.getdarkscolor,
                            fontSize: height / 25),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 20,
                ),
                const Icon(
                  Icons.alternate_email,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: width / 40,
                ),
                Customtextfild.textField(
                  "Email ID",
                  notifire.getwhitecolor,
                  width / 1.3,
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 20,
                ),
                const Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: width / 40,
                ),
                Container(
                  color: Colors.transparent,
                  height: height / 20,
                  width: width / 1.3,
                  child: Customtextfild2.textField(
                    "Password",
                    notifire.getwhitecolor,
                    GestureDetector(
                        onTap: () {
                          _toggle();
                        },
                        child: _obscureText
                            ? const Icon(Icons.remove_red_eye_rounded)
                            : const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                              )),
                    _obscureText,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const Forgot(),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Text(
                      CustomStrings.forgot,
                      style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: notifire.getprocolor,
                          fontSize: height / 50),
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 20,
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Otp();
                      },
                    ),
                  );
                },
                child: Custombutton.button(
                    notifire.getprocolor, CustomStrings.login, width),
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            Text(
              "OR",
              style: TextStyle(
                  fontFamily: 'Gilroy Medium',
                  color: Colors.grey,
                  fontSize: height / 50),
            ),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 214, 255, 187),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: height / 17,
                width: width,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 10, vertical: height / 80),
                      child: Image.asset("image/google.png"),
                    ),
                    Text(
                      CustomStrings.googles,
                      style: TextStyle(
                          fontFamily: 'Gilroy Medium',
                          color: notifire.gettextcolor,
                          fontSize: height / 50),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CustomStrings.newto,
                  style: TextStyle(
                      fontFamily: 'Gilroy Medium',
                      color: Colors.grey,
                      fontSize: height / 50),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const Register(),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Text(
                      CustomStrings.register,
                      style: TextStyle(
                          fontFamily: 'Gilroy Medium',
                          color: notifire.getprocolor,
                          fontSize: height / 50),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
