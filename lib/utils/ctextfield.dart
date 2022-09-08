import 'package:hello_fresh/utils/media.dart';
import 'package:flutter/material.dart';

class Customtextfild {
  static Widget textField(name1, textcolor, wi, [en = true]) {
    return Container(
      color: Colors.transparent,
      height: height / 20,
      width: wi,
      child: TextField(
        enabled: en,
        style: TextStyle(color: textcolor),
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 94, 173, 50))),
          fillColor: Colors.green,
          hintText: name1,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
