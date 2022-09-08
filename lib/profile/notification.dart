import 'package:hello_fresh/utils/colornotifire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/media.dart';
import '../utils/string.dart';

class Notifications extends StatefulWidget {
  final String name;
  const Notifications(this.name, {Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                  widget.name,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontFamily: 'Gilroy Bold',
                      fontSize: height / 43),
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Column(
                children: [
                  not(
                    const Color(0xff4BD37B),
                    "image/cheack.png",
                    CustomStrings.successfully,
                    CustomStrings.yesterday,
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  not(
                    const Color(0xff10AFFF),
                    "image/lockdown.png",
                    CustomStrings.lockdown,
                    CustomStrings.mar,
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  not(
                    const Color(0xffFFA03C),
                    "image/car.png",
                    CustomStrings.wayorder,
                    CustomStrings.mar1,
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  not(
                    const Color(0xff8349FF),
                    "image/dele.png",
                    CustomStrings.prepared,
                    CustomStrings.mar2,
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  not(
                    const Color(0xff10AFFF),
                    "image/lockdown.png",
                    CustomStrings.discount,
                    CustomStrings.mar3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget not(clr, img, txt, txt2) {
    return Container(
      height: height / 11,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: notifire.getbcolor,
      ),
      child: Row(
        children: [
          SizedBox(
            width: width / 35,
          ),
          Container(
            height: height / 15,
            width: width / 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: clr,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(height / 70),
                child: Image.asset(img),
              ),
            ),
          ),
          SizedBox(
            width: width / 50,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 60,
                ),
                Text(
                  txt,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontFamily: 'Gilroy Bold',
                      fontSize: height / 54),
                ),
                SizedBox(
                  height: height / 100,
                ),
                Text(
                  txt2,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Gilroy Medium',
                      fontSize: height / 55),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
