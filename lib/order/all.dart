import 'package:hello_fresh/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/string.dart';
import 'detailsorder.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
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
              height: height / 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: notifire.getbcolor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        orders(
                          Container(
                            height: height / 25,
                            width: width / 3,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                  color: const Color(0xffFE7058), width: 1.5),
                            ),
                            child: Center(
                              child: Text(
                                CustomStrings.trackorder,
                                style: TextStyle(
                                    color: const Color(0xffFE7058),
                                    fontFamily: 'Gilroy Bold',
                                    fontSize: height / 47),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: notifire.getbcolor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        orders(
                          Text(
                            CustomStrings.delivered,
                            style: TextStyle(
                                color: const Color(0xff4BD37B),
                                fontFamily: 'Gilroy Bold',
                                fontSize: height / 47),
                          ),
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: notifire.getbcolor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        orders(
                          Text(
                            CustomStrings.canceled,
                            style: TextStyle(
                                color: const Color(0xffFF1333),
                                fontFamily: 'Gilroy Bold',
                                fontSize: height / 47),
                          ),
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: notifire.getbcolor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        orders(
                          Text(
                            CustomStrings.delivered,
                            style: TextStyle(
                                color: const Color(0xff4BD37B),
                                fontFamily: 'Gilroy Bold',
                                fontSize: height / 47),
                          ),
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: notifire.getbcolor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        orders(
                          Text(
                            CustomStrings.delivered,
                            style: TextStyle(
                                color: const Color(0xff4BD37B),
                                fontFamily: 'Gilroy Bold',
                                fontSize: height / 47),
                          ),
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 60,
            ),
          ],
        ),
      ),
    );
  }

  Widget orders(se) {
    return GestureDetector(
      onTap: () {
        Get.to(
          const Boxdetails(CustomStrings.delivery, CustomStrings.pending),
        );
      },
      child: Container(
        color: Colors.transparent,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order #841565",
                      style: TextStyle(
                          color: notifire.getdarkscolor,
                          fontFamily: 'Gilroy Bold',
                          fontSize: height / 47),
                    ),
                    SizedBox(
                      height: height / 200,
                    ),
                    Text(
                      "11 Mar 2021 at 06:00 PM",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Gilroy Medium',
                          fontSize: height / 52),
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Row(
                      children: [
                        Text(
                          "20 Items",
                          style: TextStyle(
                              color: notifire.getdarkscolor,
                              fontFamily: 'Gilroy Bold',
                              fontSize: height / 47),
                        ),
                        SizedBox(
                          width: width / 2,
                        ),
                        Text(
                          "\$ 230",
                          style: TextStyle(
                              color: notifire.getprocolor,
                              fontFamily: 'Gilroy Bold',
                              fontSize: height / 47),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    se,
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 100,
            ),
          ],
        ),
      ),
    );
  }
}
