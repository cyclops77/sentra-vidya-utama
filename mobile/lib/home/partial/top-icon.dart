import 'package:flutter/material.dart';

class TopIcon extends StatelessWidget {
  final IconData ikon;
  TopIcon(this.ikon);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17.5),
      child: Icon(ikon),
    );
  }
}
