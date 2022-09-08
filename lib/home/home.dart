import 'package:hello_fresh/home/search.dart';
import 'package:hello_fresh/profile/address.dart';
import 'package:hello_fresh/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../profile/notification.dart';
import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../view/recommended.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ColorNotifire notifire;
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
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

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 8.0,
      width: isActive ? 8.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? notifire.getprocolor : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
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
                Container(
                  color: Colors.transparent,
                  height: height / 19,
                  width: width / 8,
                  child: Padding(
                    padding: EdgeInsets.all(width / 60),
                    child: Image.asset(
                      "image/loc.png",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const AddressUpdates(),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CustomStrings.address,
                          style: TextStyle(
                            fontFamily: 'Gilroy Bold',
                            color: notifire.getdarkscolor,
                            fontSize: height / 55,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              CustomStrings.washing,
                              style: TextStyle(
                                fontFamily: 'Gilroy Bold',
                                color: Colors.grey,
                                fontSize: height / 55,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: notifire.getdarkscolor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const Search(),
                    );
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
                    child: Padding(
                      padding: EdgeInsets.all(width / 50),
                      child: Image.asset(
                        "image/search.png",
                        color: notifire.getdarkscolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const Notifications(CustomStrings.notification),
                    );
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
                    child: Padding(
                      padding: EdgeInsets.all(width / 50),
                      child: Image.asset(
                        "image/notification.png",
                        color: notifire.getdarkscolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 20,
                ),
              ],
            ),
            SizedBox(height: height / 100),
            Container(
              color: notifire.getprimerycolor,
              height: height / 4.5,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width / 20,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          const Recommended(),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Image.asset(
                            "image/banner1.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          const Recommended(),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Image.asset(
                            "image/banner2.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          const Recommended(),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Image.asset(
                            "image/banner3.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              CustomStrings.recommended,
                              style: TextStyle(
                                fontFamily: 'Gilroy Bold',
                                color: notifire.getdarkscolor,
                                fontSize: height / 50,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height / 300,
                        ),
                        Text(
                          CustomStrings.based,
                          style: TextStyle(
                            fontFamily: 'Gilroy Bold',
                            color: Colors.grey.withOpacity(0.6),
                            fontSize: height / 52,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const Recommended(),
                    );
                  },
                  child: Container(
                    height: height / 20,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        CustomStrings.view,
                        style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: notifire.getdarkscolor,
                          fontSize: height / 50,
                        ),
                      ),
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
            recommended(
              "image/wash4.png",
              CustomStrings.cl,
            ),
            SizedBox(
              height: height / 80,
            ),
            recommended(
              "image/wash5.png",
              CustomStrings.cc,
            ),
            SizedBox(
              height: height / 80,
            ),
            recommended(
              "image/wash6.png",
              CustomStrings.cpl,
            ),
          ],
        ),
      ),
    );
  }

  Widget recommended(img, name) {
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
                padding: EdgeInsets.symmetric(horizontal: width / 25),
                child: Container(
                  width: width / 5,
                  height: height / 11,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(width / 20),
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
                      Image.asset(
                        "image/location.png",
                        height: height / 45,
                        color: Colors.grey,
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
                      Image.asset(
                        "image/time.png",
                        height: height / 50,
                        color: Colors.grey,
                      ),
                      Text(
                        CustomStrings.time,
                        style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: Colors.grey,
                          fontSize: height / 60,
                        ),
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

  Widget events(img, clr, name) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const Details(),
              ),
            );
          },
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            color: notifire.getprimerycolor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 6,
                    width: width / 2,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'Gilroy Bold',
                        color: notifire.getdarkscolor,
                        fontSize: height / 45,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: height / 120,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "image/location.png",
                        height: height / 45,
                        color: Colors.grey,
                      ),
                      Text(
                        CustomStrings.location,
                        style: TextStyle(
                          fontFamily: 'Gilroy Medium',
                          color: Colors.grey,
                          fontSize: height / 60,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "image/time.png",
                        height: height / 50,
                        color: Colors.grey,
                      ),
                      Text(
                        CustomStrings.time,
                        style: TextStyle(
                          fontFamily: 'Gilroy Medium',
                          color: Colors.grey,
                          fontSize: height / 60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget games(img, name, siz) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(
              const Recommended(),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              border: Border.all(color: notifire.getbcolor),
            ),
            height: height / 7,
            width: width / 3.4,
            child: Column(
              children: [
                SizedBox(
                  height: height / 100,
                ),
                Image.asset(
                  img,
                  height: siz,
                ),
                SizedBox(
                  height: height / 50,
                ),
                Center(
                  child: Text(
                    name,
                    style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontSize: height / 50,
                      fontFamily: 'Gilroy Bold',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
