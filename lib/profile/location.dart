import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_fresh/home/bottom.dart';
import 'package:hello_fresh/utils/color.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/details.dart';
import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Bottom()));
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
            SizedBox(
              height: height / 30,
            ),
            Center(
                child: Text(
              "Hi, Nice to meet you",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Gilroy Medium',
                fontSize: height / 40,
              ),
            )),
            Center(
                child: Text(
              "See services arround",
              style: TextStyle(
                color: notifire.getprocolor,
                fontFamily: 'Gilroy Bold',
                fontSize: height / 30,
              ),
            )),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Container(
                    height: height / 16,
                    width: width / 8,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: notifire.getprocolor,
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.all(width / 30),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: whiteColor,
                          )),
                    ),
                  ),
                  const Spacer(),
                  Container(
                      height: height / 16,
                      width: width / 1.35,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(13),
                        ),
                      ),
                      child: SearchField(
                        searchInputDecoration: InputDecoration(
                            hintText: "Search Location",
                            filled: true,
                            fillColor: notifire.getbcolor,
                            border: InputBorder.none),
                        onSuggestionTap: (e) {
                          Timer(Duration(milliseconds: 500), () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bottom()));
                          });
                        },
                        suggestionsDecoration: BoxDecoration(),
                        suggestions: [
                          SearchFieldListItem('Afghanistan'),
                          SearchFieldListItem('Turkey'),
                          SearchFieldListItem('Germany'),
                          SearchFieldListItem('France'),
                          SearchFieldListItem('Italy'),
                          SearchFieldListItem('Spain'),
                          SearchFieldListItem('United Kingdom'),
                          SearchFieldListItem('United States'),
                          SearchFieldListItem('Canada'),
                          SearchFieldListItem('Australia'),
                          SearchFieldListItem('New Zealand'),
                          SearchFieldListItem('India'),
                          SearchFieldListItem('Indonesia'),
                          SearchFieldListItem('Bangladesh'),
                          SearchFieldListItem('Sri Lanka'),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: height / 10,
            ),
            Image.asset(
              "image/loc.png",
              height: height / 4,
            ),
            SizedBox(
              height: height / 10,
            ),
            GestureDetector(
              onTap: (() => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Bottom()))),
              child: Container(
                height: height / 16,
                width: width * .9,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: notifire.getprocolor,
                ),
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(width / 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.my_location,
                              color: Colors.white,
                            ),
                            Text(
                              'Your current location',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Gilroy Bold',
                                fontSize: height / 40,
                              ),
                            )
                          ],
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
