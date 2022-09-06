import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';

class Boxdetails extends StatefulWidget {

 final String txt;
 final String txts;

   const Boxdetails(this.txt,this.txts,{Key? key}) : super(key: key);

  @override
  State<Boxdetails> createState() => _BoxdetailsState();
}

class _BoxdetailsState extends State<Boxdetails> {
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

    );
  }
  Widget dot() {
    return DottedLine(
      direction: Axis.vertical,
      lineLength: height / 15,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: Colors.grey,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
    );
  }

  Widget status(name2, clr, img, name) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: clr,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          height: height / 16,
          width: width / 7,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(height / 130),
              child: Image.asset(img),
            ),
          ),
        ),
        SizedBox(
          width: width / 20,
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
              height: height / 200,
            ),
            Text(
              name2,
              style: TextStyle(
                  color: notifire.getdarkscolor,
                  fontFamily: 'Gilroy Medium',
                  fontSize: height / 65),
            ),
          ],
        ),
      ],
    );
  }
}
