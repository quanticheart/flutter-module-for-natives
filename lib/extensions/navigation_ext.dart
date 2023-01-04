
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension NavigationExt on BuildContext {
  navigateToAndClear(Widget page) {
    Navigator.pushReplacement(
      this,
      PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return page;
      }),
    );
  }

  navigateTo(Widget page) {
    Navigator.push(
      this,
      PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return page;
      }),
    );
  }

  finish() {
    if (Navigator.canPop(this)) {
      Navigator.pop(this);
    } else {
      if (Platform.isIOS) {
        Navigator.pop(this);
      } else {
        SystemNavigator.pop();
      }
    }
  }
}
