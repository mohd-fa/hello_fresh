import 'package:hello_fresh/utils/colornotifire.dart';
import 'package:hello_fresh/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../utils/media.dart';
import 'delivery.dart';

class AddressUpdates extends StatefulWidget {
  const AddressUpdates({Key? key}) : super(key: key);

  @override
  State<AddressUpdates> createState() => _AddressUpdatesState();
}

class _AddressUpdatesState extends State<AddressUpdates> {
  late ColorNotifire notifire;
  bool isChecked = false;

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
                  CustomStrings.deliveryadd,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontFamily: 'Gilroy Bold',
                      fontSize: height / 43),
                ),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Column(
                children: [
                  con(
                    CustomStrings.add1,
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  con(
                    CustomStrings.add2,
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  con(
                    CustomStrings.add3,
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  con(
                    CustomStrings.add4,
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget con(name) {
    return GestureDetector(
      onTap: () {
        Get.to(
          const Address(),
        );
      },
      child: Container(
        height: height / 9,
        width: width,
        decoration: BoxDecoration(
          color: notifire.getbcolor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height / 80,
            ),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width / 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              color: notifire.getdarkscolor,
                              fontFamily: 'Gilroy Bold',
                              fontSize: height / 50),
                        ),
                        SizedBox(
                          height: height / 80,
                        ),
                        Text(
                          CustomStrings.road,
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Gilroy Medium',
                              fontSize: height / 65),
                        ),
                        SizedBox(
                          height: height / 200,
                        ),
                        Text(
                          "+88 012 356 870",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Gilroy Medium',
                              fontSize: height / 65),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: height / 20),
                  child: Image.asset(
                    "image/edit.png",
                    height: height / 40,
                    color: notifire.getdarkscolor,
                  ),
                ),
                SizedBox(
                  width: width / 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
