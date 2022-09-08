import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../utils/colornotifire.dart';
import '../utils/custombutton.dart';
import '../utils/media.dart';
import '../utils/string.dart';
import '../utils/textfeilds.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
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
                  CustomStrings.deliveryadds,
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
            Container(
              color: Colors.transparent,
              height: height / 1.6,
              width: width / 1.1,
              child: Column(
                children: [
                  Customtextfilds.textField(
                      CustomStrings.fn,
                      notifire.getprocolor,
                      Colors.grey,
                      notifire.getdarkscolor,
                      Colors.grey,
                      height / 15,
                      width / 1.2,
                      notifire.getprocolor),
                  SizedBox(height: height / 40),
                  Customtextfilds.textField(
                      CustomStrings.pn,
                      notifire.getprocolor,
                      Colors.grey,
                      notifire.getdarkscolor,
                      Colors.grey,
                      height / 15,
                      width / 1.2,
                      notifire.getprocolor),
                  SizedBox(height: height / 40),
                  Customtextfilds.textField(
                      CustomStrings.ad1,
                      notifire.getprocolor,
                      Colors.grey,
                      notifire.getdarkscolor,
                      Colors.grey,
                      height / 15,
                      width / 1.2,
                      notifire.getprocolor),
                  SizedBox(height: height / 40),
                  Customtextfilds.textField(
                      CustomStrings.ad2,
                      notifire.getprocolor,
                      Colors.grey,
                      notifire.getdarkscolor,
                      Colors.grey,
                      height / 15,
                      width / 1.2,
                      notifire.getprocolor),
                  SizedBox(height: height / 60),
                  Row(
                    children: [
                      SizedBox(width: width / 50),
                      Transform.scale(
                        scale: 1,
                        child: Checkbox(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          activeColor: notifire.getprocolor,
                          side: BorderSide(color: notifire.getprocolor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                CustomStrings.selects,
                                style: TextStyle(
                                    fontSize: height / 55,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 6.5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Custombutton.button(
                    notifire.getprocolor, CustomStrings.confirm, width),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
