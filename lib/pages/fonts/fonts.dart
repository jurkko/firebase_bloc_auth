import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle bodyText3(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.w400, fontSize: 25.0);
  }


  static TextStyle NavBarTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.w400, fontSize: 25.0);
  }
}