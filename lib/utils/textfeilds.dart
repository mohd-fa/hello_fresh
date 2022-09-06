import 'package:flutter/material.dart';

class Customtextfilds {
  static Widget textField(
      labletext, focuscolor, lablecolor, textcolor, bordercolor, h, w,iconcolor) {
    return Container(
        color: Colors.transparent,
        height: h,
        width: w,
        child: TextField(
          style: TextStyle(color: textcolor),
          onChanged: (value) {},
          // obscureText: hidePassword, //show/hide password
          decoration: InputDecoration(
            hintText: labletext,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: TextStyle(color: lablecolor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bordercolor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focuscolor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
    );
  }
}