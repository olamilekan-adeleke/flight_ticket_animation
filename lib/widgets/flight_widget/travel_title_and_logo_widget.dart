import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../sizer_box_helper.dart';

class TravelTitleAndLogoWidget extends StatefulWidget {
  const TravelTitleAndLogoWidget({Key? key}) : super(key: key);

  @override
  State<TravelTitleAndLogoWidget> createState() =>
      _TravelTitleAndLogoWidgetState();
}

class _TravelTitleAndLogoWidgetState extends State<TravelTitleAndLogoWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );

  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.5, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(curve: Curves.easeIn, parent: _animationController),
    );

    _fadeAnimation = CurvedAnimation(
      curve: Curves.easeIn,
      parent: _animationController,
    );

    Future.delayed(const Duration(milliseconds: 900)).then(((value) {
      _animationController.forward();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: Image.asset('assets/logo.png', height: 42.h, width: 200.w),
          ),
          const H(height: 20),
          SlideTransition(
            position: _offsetAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff667085),
                  ),
                ),
                Text(
                  'Enigma Kod',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
