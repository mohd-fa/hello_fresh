// import 'package:hello_fresh/home/bottom.dart';
import 'package:hello_fresh/home/bottom.dart';
import 'package:hello_fresh/login_password/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_fresh/profile/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/ctextfield.dart';
import '../utils/custombutton.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 20,
            ),
            Row(
              children: [
                SizedBox(
                  height: height / 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                              color: const Color(0xfff1f5f6), width: 2),
                          color: Colors.transparent,
                        ),
                        height: height / 19,
                        width: width / 8,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: notifire.getdarkscolor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                        CustomStrings.signup,
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
                  Icons.person_outline_sharp,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: width / 40,
                ),
                Customtextfild.textField(
                  "Full name",
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
                  Icons.phone,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: width / 40,
                ),
                Customtextfild.textField(
                    "99xxxxx999", notifire.getwhitecolor, width / 1.3, false),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Text(
                    CustomStrings.by,
                    style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        color: Colors.grey,
                        fontSize: height / 60),
                  ),
                  Text(
                    CustomStrings.tc,
                    style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        color: notifire.getprocolor,
                        fontSize: height / 60),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Text(
                    CustomStrings.and,
                    style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        color: Colors.grey,
                        fontSize: height / 60),
                  ),
                  Text(
                    CustomStrings.pri,
                    style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        color: notifire.getprocolor,
                        fontSize: height / 60),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return const Location();
                      },
                    ), (Route<dynamic> route) => false);
                  },
                  child: Custombutton.button(
                      notifire.getprocolor, CustomStrings.continues, width)),
            ),
          ],
        ),
      ),
    );
  }
}
