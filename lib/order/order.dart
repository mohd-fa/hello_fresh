import 'package:hello_fresh/bottom.dart';
import 'package:hello_fresh/order/all.dart';
import 'package:hello_fresh/order/delivered.dart';
import 'package:hello_fresh/order/progress.dart';
import 'package:hello_fresh/utils/colornotifire.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/media.dart';
import '../utils/string.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const Bottom(),
                      ),
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
                    height: height / 20,
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
                  CustomStrings.myorder,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontFamily: 'Gilroy Bold',
                      fontSize: height / 43),
                ),
              ],
            ),
            SizedBox(
              height: height / 80,
            ),
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height / 1.27,
              width: MediaQuery.of(context).size.width,
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: notifire.getbcolor,
                      ),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: TabBar(
                        unselectedLabelColor: notifire.getprocolor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: notifire.getprocolor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        tabs: const [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(CustomStrings.all),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(CustomStrings.progress),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(CustomStrings.delivered),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height / 80),
                    const Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          All(),
                          Progresse(),
                          Delivered(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
