import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  final IconData ikon;
  final Function fun;
  BottomIcon(this.ikon, this.fun);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        ikon,
      ),
      onPressed: fun,
    );
  }
}
