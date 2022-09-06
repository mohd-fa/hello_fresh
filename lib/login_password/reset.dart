import 'package:hello_fresh/bottom.dart';
import 'package:hello_fresh/login_password/login.dart';
import 'package:hello_fresh/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../home/bottom.dart';
import '../utils/colornotifire.dart';
import '../utils/custombutton.dart';
import '../utils/itextfield.dart';
import '../utils/media.dart';

class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  late ColorNotifire notifire;

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

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
                        CustomStrings.rp,
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
              height: height / 25,
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
                        toggle();
                      },
                      child: obscureText
                          ? const Icon(Icons.remove_red_eye_rounded)
                          : const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.grey,
                            ),
                    ),
                    obscureText,
                  ),
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
                  Get.to(const Bottom());
                },
                child: Custombutton.button(
                    notifire.getprocolor, CustomStrings.submitig, width),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
