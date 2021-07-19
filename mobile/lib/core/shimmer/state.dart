import 'package:mobile/core/shimmer/effect.dart';
import 'package:mobile/core/sizebox.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final bool loading;
  final Widget doneWidget;
  final double height, width, sizeHeight;
  final int quantity;
  final BorderRadius borderRadius;

  Skeleton(
      {this.loading,
      this.sizeHeight,
      this.borderRadius,
      this.doneWidget,
      this.height,
      this.quantity = 1,
      this.width});
  @override
  Widget build(BuildContext context) {
    return loading
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < quantity; i++) ...[
                ShimmerEffect(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: borderRadius ??
                                BorderRadius.all(Radius.circular(12.5))),
                        height: height,
                        width: quantity != 1 && i + 1 == quantity
                            ? width * 0.5
                            : width)),
                if (quantity != 1) ...[Verticals(sizeHeight ?? 2.5)]
              ]
            ],
          )
        : doneWidget;
  }
}
