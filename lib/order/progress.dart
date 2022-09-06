import 'package:hello_fresh/order/detailsorder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Progresse extends StatefulWidget {
  const Progresse({Key? key}) : super(key: key);

  @override
  State<Progresse> createState() => _ProgresseState();
}

class _ProgresseState extends State<Progresse> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Container(
                decoration: BoxDecoration(
                  color: notifire.getbcolor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: orders(
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
              ),
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
              height: height / 30,
            ),
          ],
        ),
      ),
    );
  }
}
