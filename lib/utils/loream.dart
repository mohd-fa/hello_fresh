import 'package:hello_fresh/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colornotifire.dart';
import 'media.dart';

class Loream extends StatefulWidget {
  final String title;
  const Loream(this.title, {Key? key}) : super(key: key);

  @override
  State<Loream> createState() => _LoreamState();
}

class _LoreamState extends State<Loream> {
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
                SizedBox(
                  width: width / 20,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontFamily: 'Gilroy Bold',
                      fontSize: height / 43),
                ),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Column(
                children: [
                  Text(
                    CustomStrings.lorem,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Normal'),
                  ),
                  SizedBox(height: height / 30),
                  Text(
                    CustomStrings.lorem2,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Normal'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
