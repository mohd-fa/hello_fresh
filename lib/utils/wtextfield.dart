import 'package:hello_fresh/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Customtextfild3 {
  static Widget textField(textcolor, hinttext, wid, type, no, align) {
    return Container(
      color: Colors.transparent,
      height: height / 30,
      width: wid,
      child: TextField(
        keyboardType: type,
        inputFormatters: [
          LengthLimitingTextInputFormatter(no),
        ],
        style: TextStyle(color: textcolor, fontSize: 13),
        textAlign: align,
        decoration: InputDecoration(
          labelText: hinttext,
          labelStyle: const TextStyle(color: Colors.grey),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff80818d), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff5669FF), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
