import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../dash_line_widget.dart';

class FlightPathIconWidget extends StatefulWidget {
  const FlightPathIconWidget({Key? key}) : super(key: key);

  @override
  State<FlightPathIconWidget> createState() => _FlightPathIconWidgetState();
}

class _FlightPathIconWidgetState extends State<FlightPathIconWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );
  late Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _sizeAnimation = Tween(begin: 0, end: 34).animate(_animationController);

    Future.delayed(const Duration(milliseconds: 1000)).then(((value) {
      _animationController.forward();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.50.sw,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            width: 0.50.sw,
            child: Row(
              children: [
                Container(
                  height: 5.h,
                  width: 5.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xff808899)),
                  ),
                ),
                const DashedLine(
                  direction: Axis.horizontal,
                  dashWidth: 10.0,
                  height: 1,
                  color: Color(0xffCCCFD6),
                ),
                Container(
                  height: 5.h,
                  width: 5.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xff808899)),
                  ),
                )
              ],
            ),
          ),
          ScaleTransition(
            scale: _animationController,
            child: Container(
              height: 34.h,
              width: 34.w,
              decoration: const BoxDecoration(
                color: Color(0xff141D3E),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/flight_icon.svg',
                  width: 10.42.w,
                  height: 11.33.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
