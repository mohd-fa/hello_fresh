import 'package:flutter/material.dart';

import 'media.dart';

class Custombutton {
  static Widget button(clr,text,wi){
    return Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: clr,
          ),
          height: height / 17,
          width: wi,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: height / 45,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
    );
  }
}