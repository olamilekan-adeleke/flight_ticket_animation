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
    with TickerProviderStateMixin {
  late bool isFirstTime = true;
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );

  late final AnimationController _animationTwoController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  late Animation<double> _sizeOneAnimation;
  late Animation<double> _sizeTwoAnimation;
  late Animation<double> _sizeThreeAnimation;

  late Animation<Offset> _slideOneAnimation;
  late Animation<Offset> _slideTwoAnimation;

  @override
  void initState() {
    super.initState();

    startFirstAnimation();

    Future.delayed(const Duration(milliseconds: 1000)).then(((value) {
      _animationController.forward();
    }));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFirstTime = false;
        });

        startSecondAnimation();
      }
    });
  }

  void startFirstAnimation() {
    _sizeOneAnimation = Tween<double>(begin: 0, end: 0.8).animate(
      CurvedAnimation(
        curve: const Interval(0.0, 0.3),
        parent: _animationController,
      ),
    );

    _slideOneAnimation = Tween<Offset>(
      begin: const Offset(-2.3, 0),
      end: const Offset(2.3, 0),
    ).animate(
      CurvedAnimation(
        curve: const Interval(0.3, 0.7),
        parent: _animationController,
      ),
    );

    _sizeTwoAnimation = Tween<double>(begin: 0.8, end: 0).animate(
      CurvedAnimation(
        curve: const Interval(0.7, 1.0),
        parent: _animationController,
      ),
    );
  }

  void startSecondAnimation() {
    // Second Controller start
    _sizeThreeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: const Interval(0.0, 0.2),
        parent: _animationTwoController,
      ),
    );

    _slideTwoAnimation = Tween<Offset>(
      begin: const Offset(-2.3, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        curve: const Interval(0.2, 1, curve: Curves.bounceOut),
        parent: _animationTwoController,
      ),
    );

    _animationTwoController.forward();
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
          SlideTransition(
            position: isFirstTime ? _slideOneAnimation : _slideTwoAnimation,
            child: ScaleTransition(
              scale: isFirstTime ? _sizeTwoAnimation : _sizeThreeAnimation,
              child: ScaleTransition(
                scale: _sizeOneAnimation,
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
            ),
          ),
        ],
      ),
    );
  }
}
