// import 'package:hello_freshresh/home/home.dart';
import 'package:hello_fresh/order/order.dart';
import 'package:hello_fresh/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'message/message.dart';
// import 'profile/profile.dart';
import 'utils/colornotifire.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  late ColorNotifire notifire;
  bool selected = false;

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

  int _selectedIndex = 0;

  final widgetOptions = [
    const Order(),
    const Order(),
    const Order(),
    const Order(),
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return true;
        }
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      },
      child: Scaffold(
          backgroundColor: notifire.getprimerycolor,
          bottomNavigationBar: Container(
            height: height / 12,
            margin: EdgeInsets.symmetric(
                horizontal: width / 20, vertical: width / 40),
            decoration: BoxDecoration(
              color: notifire.getbcolor,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 40),
              child: SalomonBottomBar(
                curve: Curves.easeInOut,
                itemPadding: EdgeInsets.all(height / 100),
                itemShape: const StadiumBorder(side: BorderSide.none),
                selectedItemColor: notifire.getbcolor,
                currentIndex: _selectedIndex,
                items: [
                  SalomonBottomBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(
                          left: width / 100,
                          top: width / 100,
                          bottom: width / 100),
                      child: Image.asset("image/ihome.png",
                          color: _selectedIndex == 0
                              ? notifire.getprocolor
                              : Colors.black,
                          height: height / 30),
                    ),
                    selectedColor: notifire.getprocolor,
                    title: const Text(""),
                  ),
                  SalomonBottomBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(
                          left: width / 100,
                          top: width / 100,
                          bottom: width / 100),
                      child: Image.asset("image/document.png",
                          color: _selectedIndex == 1
                              ? notifire.getprocolor
                              : Colors.black,
                          height: height / 30),
                    ),
                    title: const Text(""),
                    selectedColor: notifire.getprocolor,
                  ),
                  SalomonBottomBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(
                          left: width / 100,
                          top: width / 100,
                          bottom: width / 100),
                      child: Image.asset("image/chat.png",
                          color: _selectedIndex == 2
                              ? notifire.getprocolor
                              : Colors.black,
                          height: height / 30),
                    ),
                    title: const Text(""),
                    selectedColor: notifire.getprocolor,
                  ),
                  SalomonBottomBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(
                          left: width / 100,
                          top: width / 100,
                          bottom: width / 100),
                      child: Image.asset("image/setting.png",
                          color: _selectedIndex == 3
                              ? notifire.getprocolor
                              : Colors.black,
                          height: height / 30),
                    ),
                    title: const Text(""),
                    selectedColor: notifire.getprocolor,
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
          body: Center(
            child: widgetOptions.elementAt(_selectedIndex),
          )),
    );
  }
}
