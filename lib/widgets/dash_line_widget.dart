import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double height;
  final double heightContainer;
  final Color color;
  final double dashWidth;
  final Axis direction;

  const DashedLine({
    this.height = 3,
    this.color = Colors.black,
    this.heightContainer = 70,
    this.dashWidth = 1.0,
    this.direction = Axis.vertical,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: direction == Axis.vertical ? heightContainer - 0.8 : 10,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxHeight = constraints.constrainHeight();
          final dashHeight = height;
          final dashCount = direction == Axis.vertical
              ? (boxHeight / (2 * dashHeight)).floor()
              : 18;

          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: direction,
            children: List.generate(
              dashCount,
              (_) {
                return SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: color),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
