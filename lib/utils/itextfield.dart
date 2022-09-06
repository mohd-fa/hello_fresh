import 'package:hello_fresh/utils/media.dart';
import 'package:flutter/material.dart';

class Customtextfild2 {
  static Widget textField(name1, textcolor, se, txt) {
    return Container(
      color: Colors.transparent,
      height: height / 20,
      width: width / 1.3,
      child: TextField(
        obscureText: txt,
        style: TextStyle(color: textcolor),
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: name1,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: Padding(padding: const EdgeInsets.all(10), child: se),
        ),
      ),
    );
  }
}
