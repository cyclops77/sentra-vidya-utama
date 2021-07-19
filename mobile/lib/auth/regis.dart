import 'package:flutter/material.dart';
import 'package:mobile/auth/login.dart';
import 'package:mobile/core/button.dart';
import 'package:mobile/core/href.dart';
import 'package:mobile/core/input.dart';
import 'package:mobile/core/size.dart';
import 'package:mobile/core/sizebox.dart';
import 'package:mobile/home/index.dart';
import 'package:mobile/vm/post-vm.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController konfirm = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController name = new TextEditingController();
  regis() {
    PostVM.regis(
            email.text, password.text, konfirm.text, username.text, name.text)
        .then((value) {
      if (value.toString() == 'ok') {
        Routes.stfR(context, InstaHome());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff8faf8),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Indonesia (Indonesian)',
              style: TextStyle(color: Colors.black38, fontSize: 12),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.black38, size: 15)
          ],
        ),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.04),
        child: ListView(
          children: [
            Verticals(displayHeight(context) * 0.125),
            SizedBox(
                height: 60, child: Image.asset("assets/images/insta_logo.png")),
            Verticals(40),
            Container(
              height: 50,
              child: Input(
                placeholder: 'Enter your full name',
                lines: 1,
                size: 12,
                controller: name,
                paddingVertical: 0,
              ),
            ),
            Verticals(8.5),
            Container(
              height: 50,
              child: Input(
                placeholder: 'Enter your username',
                lines: 1,
                size: 12,
                controller: username,
                paddingVertical: 0,
              ),
            ),
            Verticals(8.5),
            Container(
              height: 50,
              child: Input(
                placeholder: 'Enter your email',
                lines: 1,
                controller: email,
                size: 12,
                paddingVertical: 0,
              ),
            ),
            Verticals(8.5),
            Container(
              height: 50,
              child: Input(
                placeholder: 'Enter your password',
                lines: 1,
                controller: password,
                size: 12,
                hidden: true,
                paddingVertical: 0,
              ),
            ),
            Verticals(8.5),
            Container(
              height: 50,
              child: Input(
                placeholder: 'Re-enter your password',
                lines: 1,
                controller: konfirm,
                size: 12,
                hidden: true,
                paddingVertical: 0,
              ),
            ),
            Verticals(15),
            Button(
              fun: () {
                regis();
              },
              colorButton: Colors.blue,
              colorText: Colors.white,
              isi: "Registrasi",
            ),
            Verticals(15),
            TextButton(
                onPressed: () {
                  Routes.stfR(context, LoginScreen());
                },
                child: Text(
                  "Klik disini untuk login",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }
}
