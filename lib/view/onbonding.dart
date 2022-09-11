import 'package:hello_fresh/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../login_password/login.dart';
import '../utils/colornotifire.dart';
import '../utils/string.dart';

class Onbonding extends StatefulWidget {
  const Onbonding({Key? key}) : super(key: key);

  @override
  _OnbondingState createState() => _OnbondingState();
}

class _OnbondingState extends State<Onbonding> {
  final int _numPages = 3;

  late ColorNotifire notifire;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 8.0,
      width: isActive ? 8.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive
            ? notifire.getprocolor
            : notifire.getprocolor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    color: notifire.getprimerycolor,
                    height: height,
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: height / 4),
                                    Image.asset(
                                      "image/onbondingg1.png",
                                      height: height / 3,
                                    ),
                                    SizedBox(height: height / 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width / 15,
                                        ),
                                        Text(
                                          CustomStrings.onbonding1,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy Bold',
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 30),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 60),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width / 15),
                                      child: Text(
                                        CustomStrings.onbondings1,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: 'Gilroy Medium',
                                            color: notifire.getdarkscolor,
                                            fontSize: height / 60),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: height / 4),
                                        Image.asset(
                                          "image/onbondingg2.png",
                                          height: height / 3,
                                        ),
                                        SizedBox(height: height / 10),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width / 15,
                                            ),
                                            Text(
                                              CustomStrings.onbonding2,
                                              style: TextStyle(
                                                  fontFamily: 'Gilroy Bold',
                                                  color: notifire.getdarkscolor,
                                                  fontSize: height / 28),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: height / 60),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: width / 15),
                                          child: Text(
                                            CustomStrings.onbondings2,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: 'Gilroy Medium',
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 60),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: height / 4),
                                    Image.asset(
                                      "image/onbondingg3.png",
                                      height: height / 3,
                                    ),
                                    SizedBox(height: height / 10),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width / 15,
                                        ),
                                        Text(
                                          CustomStrings.onbonding3,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy Bold',
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 28),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 60),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width / 15),
                                      child: Text(
                                        CustomStrings.onbondings3,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: 'Gilroy Medium',
                                            color: notifire.getdarkscolor,
                                            fontSize: height / 60),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _currentPage != _numPages - 1
                ? Column(
                    children: [
                      SizedBox(height: height / 1.15),
                      Align(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _buildPageIndicator(),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const Login();
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        notifire.getprocolor.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  height: height / 20,
                                  width: width / 4,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Center(
                                      child: Text(
                                        CustomStrings.skip,
                                        style: TextStyle(
                                            fontFamily: 'Gilroy Bold',
                                            color: notifire.getprocolor,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(height: height / 1.15),
                      Align(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _buildPageIndicator(),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const Login();
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        notifire.getprocolor.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  height: height / 20,
                                  width: width / 4,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Center(
                                      child: Text(
                                        CustomStrings.start,
                                        style: TextStyle(
                                            fontFamily: 'Gilroy Bold',
                                            color: notifire.getprocolor,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
