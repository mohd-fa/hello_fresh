import 'package:hello_fresh/bottom.dart';
import 'package:hello_fresh/login_password/register.dart';
import 'package:hello_fresh/utils/colornotifire.dart';
import 'package:hello_fresh/utils/custombutton.dart';
import 'package:hello_fresh/utils/media.dart';
import 'package:hello_fresh/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../home/bottom.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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
              Image.asset(
                "image/otps.png",
                height: height / 4,
              ),
              SizedBox(
                height: height / 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CustomStrings.otp,
                          style: TextStyle(
                              fontFamily: 'Gilroy Bold',
                              color: notifire.getdarkscolor,
                              fontSize: height / 25),
                        ),
                        SizedBox(
                          height: height / 50,
                        ),
                        Text(
                          CustomStrings.codes,
                          style: TextStyle(
                              fontFamily: 'Gilroy Medium',
                              color: notifire.gettextcolor,
                              fontSize: height / 50),
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                        Text(
                          "+91 99xxxxx999",
                          style: TextStyle(
                              fontFamily: 'Gilroy Medium',
                              color: notifire.gettextcolor,
                              fontSize: height / 55),
                        ),
                        SizedBox(
                          height: height / 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  otpfild(),
                  otpfild(),
                  otpfild(),
                  otpfild(),
                ],
              ),
              SizedBox(
                height: height / 3.3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Register();
                        },
                      ),
                    );
                  },
                  child: Custombutton.button(
                      notifire.getprocolor, CustomStrings.confirm, width),
                ),
              ),
            ],
          ),
        ));
  }

  Widget otpfild() {
    return Container(
      height: height / 15,
      width: width / 8,
      decoration: const BoxDecoration(
        color: Color.fromARGB(125, 214, 255, 187),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: height / 40,
            color: notifire.getdarkscolor,
            fontFamily: 'Gilroy Bold'),
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
