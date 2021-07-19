import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/auth/login.dart';
import 'package:mobile/core/href.dart';
import 'package:mobile/core/size.dart';
import 'package:mobile/home/index.dart';
import 'package:mobile/vm/post-vm.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  starts() async {
    var timer = Duration(seconds: 1);
    return Timer(timer, () {
      PostVM.cekAuth().then((value) {
        if (value == 'home') {
          Routes.stfR(context, InstaHome());
        } else {
          Routes.stfR(context, LoginScreen());
        }
      }).catchError((onError) {});
    });
  }

  @override
  void initState() {
    starts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
      ),
    );
  }
}
