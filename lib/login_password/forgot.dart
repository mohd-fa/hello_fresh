import 'package:hello_fresh/login_password/reset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/ctextfield.dart';
import '../utils/custombutton.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
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
                      border:
                          Border.all(color: const Color(0xfff1f5f6), width: 2),
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
                        CustomStrings.fg,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: Text(
                CustomStrings.fdetails,
                style: TextStyle(
                    fontFamily: 'Gilroy Medium',
                    color: Colors.grey,
                    fontSize: height / 55),
              ),
            ),
            SizedBox(
              height: height / 25,
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
                  "Email ID / Mobile number",
                  notifire.getwhitecolor,
                  width / 1.3,
                ),
              ],
            ),
            SizedBox(
              height: height / 4.5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    const Reset(),
                  );
                },
                child: Custombutton.button(
                    notifire.getprocolor, CustomStrings.submit, width),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
