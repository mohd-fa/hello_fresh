import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/details.dart';
import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Recommended extends StatefulWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
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
                  CustomStrings.recommended,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontFamily: 'Gilroy Bold',
                      fontSize: height / 43),
                ),
              ],
            ),
            SizedBox(height: height / 40,),
            recommended("image/wash4.png", CustomStrings.cl,),
            SizedBox(
              height: height / 80,
            ),
            recommended("image/wash5.png", CustomStrings.cc,),
            SizedBox(
              height: height / 80,
            ),
            recommended("image/wash6.png", CustomStrings.cpl,),  SizedBox(
              height: height / 80,
            ),
            recommended("image/wash4.png", CustomStrings.cl,),  SizedBox(
              height: height / 80,
            ),
            recommended("image/wash2.png", CustomStrings.cc,),  SizedBox(
              height: height / 80,
            ),
            recommended("image/wash3.png", CustomStrings.cpl,),
          ],
        ),
      ),
    );
  }

  Widget recommended(img,name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const Details(),
            ),
          );
        },
        child: Container(
          height: height / 8,
          width: width,
          decoration: BoxDecoration(
            color: notifire.getbcolor,
            borderRadius: BorderRadius.all(
              Radius.circular(width / 20),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(width / 25),
                child: Container(
                  width: width / 5,
                  height: height / 11,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: width / 25,
                  ),
                  Text(
                   name,
                    style: TextStyle(
                      fontFamily: 'Gilroy Bold',
                      color: notifire.getdarkscolor,
                      fontSize: height / 50,
                    ),
                  ),
                  SizedBox(
                    height: height / 200,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                        size: height / 40,
                      ),
                      Text(
                        CustomStrings.location,
                        style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: Colors.grey,
                          fontSize: height / 60,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 200,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.alarm,
                        color: Colors.grey,
                        size: height / 50,
                      ),
                      Text(
                        CustomStrings.time,
                        style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: Colors.grey,
                          fontSize: height / 60,
                        ),
                      ),
                      SizedBox(
                        width: width / 100,
                      ),
                      Icon(
                        Icons.star,
                        color: const Color(0xfffdc500),
                        size: height / 50,
                      ),
                      Icon(
                        Icons.star,
                        color: const Color(0xfffdc500),
                        size: height / 50,
                      ),
                      Icon(
                        Icons.star,
                        color: const Color(0xfffdc500),
                        size: height / 50,
                      ),
                      Icon(
                        Icons.star,
                        color: const Color(0xfffdc500),
                        size: height / 50,
                      ),
                      Icon(
                        Icons.star,
                        color: const Color(0xfffdc500),
                        size: height / 50,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
