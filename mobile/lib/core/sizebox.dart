import 'package:flutter/material.dart';

class Verticals extends StatelessWidget {
  final double val;
  Verticals(this.val);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: val);
  }
}

class Horizontals extends StatelessWidget {
  final double val;
  Horizontals(this.val);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: val);
  }
}
