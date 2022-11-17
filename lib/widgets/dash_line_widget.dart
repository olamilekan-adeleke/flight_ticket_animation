import 'package:flutter/material.dart';

class DashedLine extends StatefulWidget {
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
  State<DashedLine> createState() => _DashedLineState();
}

class _DashedLineState extends State<DashedLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    startAnimation();
  }

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 800));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SizedBox(
        height: widget.direction == Axis.vertical
            ? widget.heightContainer - 0.8
            : 10,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final boxHeight = constraints.constrainHeight();
            final dashHeight = widget.height;
            final dashCount = widget.direction == Axis.vertical
                ? (boxHeight / (2 * dashHeight)).floor()
                : 18;

            return Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: widget.direction,
              children: List.generate(
                dashCount,
                (_) {
                  return SizedBox(
                    width: widget.dashWidth,
                    height: dashHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: widget.color),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
