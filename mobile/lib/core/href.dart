import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static stf(BuildContext context, StatefulWidget classes) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return classes;
    }));
  }

  static stl(BuildContext context, StatefulWidget classes) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return classes;
    }));
  }

  static stfA(BuildContext context, StatefulWidget classes) {
    Navigator.push(
        context, PageTransition(type: PageTransitionType.fade, child: classes));
  }

  static stfR(BuildContext context, StatefulWidget classes) {
    Navigator.pushReplacement(
        context, PageTransition(type: PageTransitionType.fade, child: classes));
  }
}
