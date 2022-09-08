import 'package:hello_fresh/bottom.dart';
import 'package:hello_fresh/login_password/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/ctextfield.dart';
import '../utils/custombutton.dart';
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

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 12,
            ),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Bottom();
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: width / 20),
                    color: Colors.transparent,
                    child: Text(
                      CustomStrings.skip,
                      style: TextStyle(
                          fontFamily: 'Gilroy Medium',
                          color: notifire.getprocolor,
                          fontSize: height / 50),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Image.asset(
              "image/cleans.png",
              height: height / 4,
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: width / 15),
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     CustomStrings.login,
            //     style: TextStyle(
            //         fontFamily: 'Gilroy Bold',
            //         color: notifire.getdarkscolor,
            //         fontSize: height / 25),
            //   ),
            // ),
            SizedBox(
              height: height / 30,
            ),
            Container(
              padding: EdgeInsets.only(left: width / 20),
              alignment: Alignment.centerLeft,
              child: Text(
                CustomStrings.pn,
                style: TextStyle(
                    fontFamily: 'Gilroy Bold',
                    color: notifire.getdarkscolor,
                    fontSize: height / 40),
              ),
            ),
            SizedBox(height: height / 100),
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
                  "Enter Phone Number",
                  notifire.getwhitecolor,
                  width / 1.3,
                ),
              ],
            ),
            SizedBox(
              height: height / 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    const Otp(),
                  );
                },
                child: Custombutton.button(
                    notifire.getprocolor, CustomStrings.login, width),
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
          ],
        ),
      ),
    );
  }
}
