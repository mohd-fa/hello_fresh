import 'package:flutter/material.dart';

import 'color.dart';

class ColorNotifire with ChangeNotifier {
  bool isDark = false;
  set setIsDark(value) {
    isDark = value;
    notifyListeners();
  }

  get getIsDark => isDark;

  get getprimerycolor => isDark ? darkPrimeryColor : primeryColor;
  get getcardcolor => isDark ? darkcardColor : cardColor;
  get gettextcolor => isDark ? darktextColor : textColor;
  get getprocolor => isDark ? darkproColor : proColor;
  get getprecolor => isDark ? darkpreColor : preColor;
  get gettext1color => isDark ? darktext1Color : text1Color;
  get getcolors => isDark ? darktopColor : darktext1Color;
  get getwhitecolor => isDark ? whiteColor : darkwhiteColor;
  get getbcolor => isDark ? bColor : darkbColor;
  get gettextxcolor => isDark ? textssColor : textxcolor;
  get gettopcolor => isDark ? darktopColor : topColor;
  get getdarkscolor => isDark ? blackColor: darkblackColor;
  get getbluecolor => isDark ? darkblueColor : blueColor;
  get getorangecolor => isDark ? darkorangeColor : orangeColor;
  get getpinkcolor => isDark ? darkpinkColor : pinkColor;
  get getblackcolor => isDark ? darkwhiteColor : whiteColor;


}
