import 'package:flutter/material.dart';

class IconPart extends StatelessWidget {
  final IconData ikon;
  final double right;
  final Function fun;
  final Color warna;
  IconPart({this.fun, this.warna, this.ikon, this.right = 0});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: right),
      child: InkWell(
        onTap: fun,
        child: Icon(
          ikon,
          size: 24,
          color: warna ?? Colors.black,
        ),
      ),
    );
  }
}
