// import 'package:hello_fresh/home/additem.dart';
import 'package:hello_fresh/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../utils/colornotifire.dart';
import '../utils/custombutton.dart';
import '../utils/string.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  height: height / 2,
                  width: width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    child: Image.asset(
                      "image/details.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
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
                    SizedBox(
                      height: height / 3,
                    ),
                    Container(
                      height: height / 1.75,
                      width: width,
                      decoration: BoxDecoration(
                        color: notifire.getprimerycolor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height / 40,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width / 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    CustomStrings.wow,
                                    style: TextStyle(
                                      fontFamily: 'Gilroy Bold',
                                      color: notifire.getdarkscolor,
                                      fontSize: height / 35,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 100,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "image/location.png",
                                        height: height / 45,
                                        color: notifire.getprocolor,
                                      ),
                                      Text(
                                        CustomStrings.location,
                                        style: TextStyle(
                                          fontFamily: 'Gilroy Medium',
                                          color: notifire.getdarkscolor,
                                          fontSize: height / 60,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(width / 20),
                            child: Container(
                              width: width,
                              height: height / 10,
                              decoration: BoxDecoration(
                                color: notifire.getbcolor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: height / 65,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                          Text(
                                            CustomStrings.review,
                                            style: TextStyle(
                                              fontFamily: 'Gilroy Bold',
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 50,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height / 200,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: notifire.getprocolor,
                                            size: height / 40,
                                          ),
                                          SizedBox(
                                            width: width / 70,
                                          ),
                                          Text(
                                            "3.8",
                                            style: TextStyle(
                                              fontFamily: 'Gilroy Bold',
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 60,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width / 60,
                                          ),
                                          Text(
                                            "|",
                                            style: TextStyle(
                                              fontFamily: 'Gilroy Medium',
                                              color: Colors.grey,
                                              fontSize: height / 40,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width / 60,
                                          ),
                                          Text(
                                            "720 Reviews",
                                            style: TextStyle(
                                              fontFamily: 'Gilroy Bold',
                                              color: Colors.grey,
                                              fontSize: height / 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: width / 4,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: height / 30,
                                      ),
                                      Stack(
                                        children: [
                                          Image.asset(
                                            "image/p3.png",
                                            height: height / 27,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: width / 20,
                                              ),
                                              Stack(
                                                children: [
                                                  Image.asset(
                                                    "image/p4.png",
                                                    height: height / 27,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: width / 20,
                                                      ),
                                                      Container(
                                                        height: height / 27,
                                                        width: width / 10,
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Center(
                                                          child: Icon(
                                                            Icons.more_horiz,
                                                            color: notifire
                                                                .getprocolor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width / 20,
                              ),
                              Text(
                                CustomStrings.about,
                                style: TextStyle(
                                  fontFamily: 'Gilroy Bold',
                                  color: notifire.getdarkscolor,
                                  fontSize: height / 45,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 100,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 20),
                            child: Text(
                              CustomStrings.us,
                              style: TextStyle(
                                fontFamily: 'Gilroy Medium',
                                color: Colors.grey,
                                fontSize: height / 60,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 20),
                            child: Text(
                              CustomStrings.us,
                              style: TextStyle(
                                fontFamily: 'Gilroy Medium',
                                color: Colors.grey,
                                fontSize: height / 60,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              color: notifire.getbcolor,
                            ),
                            height: height / 10,
                            width: width,
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  // Get.to(
                                  //   const Additem(),
                                  // );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 15),
                                  child: Custombutton.button(
                                      notifire.getprocolor,
                                      CustomStrings.up,
                                      width),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
