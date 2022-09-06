import 'dart:async';

import 'package:hello_fresh/login_password/login.dart';
import 'package:hello_fresh/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/colornotifire.dart';

class Spleshscreen extends StatefulWidget {
  const Spleshscreen({Key? key}) : super(key: key);

  @override
  _SpleshscreenState createState() => _SpleshscreenState();
}

class _SpleshscreenState extends State<Spleshscreen> {
  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(context,
          PageTransition(type: PageTransitionType.fade, child: const Login())),
    );
  }

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
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 167, 21),
      body: Stack(
        children: [
          Image.asset(
            "image/splesh.png",
            fit: BoxFit.fill,
            height: height,
            width: width,
          ),
          Center(
            child: Container(
              height: height / 4,
              width: width / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  "image/cleans1.png",
                  height: height / 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
