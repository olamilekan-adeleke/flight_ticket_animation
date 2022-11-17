import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../dash_line_widget.dart';
import '../sizer_box_helper.dart';
import 'flight_path_icon_widget.dart';

class TravelDetailsWidget extends StatefulWidget {
  const TravelDetailsWidget({Key? key}) : super(key: key);

  @override
  State<TravelDetailsWidget> createState() => _TravelDetailsWidgetState();
}

class _TravelDetailsWidgetState extends State<TravelDetailsWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );

  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

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
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (_, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const DashedLine(
              direction: Axis.horizontal,
              dashWidth: 12.0,
              color: Color(0xffCCCFD6),
            ),
            const H(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (_, int index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: locationTextWidget('ABV', 'Abuja'),
                        ),
                        const FlightPathIconWidget(),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: locationTextWidget('LHR', 'London'),
                        ),
                      ],
                    ),
                    const H(height: 15),
                    Row(
                      children: [
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: boardingTextWidget(
                            'Boarding Date',
                            'Aug 12, 2022',
                          ),
                        ),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: boardingTextWidget(
                            'Boarding Time',
                            '9:30am',
                            true,
                          ),
                        ),
                      ],
                    ),
                    const H(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: boardingTextWidget('Gate', 'J22'),
                        ),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: boardingTextWidget('Seat', '19J'),
                        ),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: boardingTextWidget('Flight No.', 'DN2903'),
                        ),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: boardingTextWidget('Luggage', '3 Y'),
                        ),
                      ],
                    ),
                    const H(height: 20),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget locationTextWidget(String abb, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          abb,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xff667085),
          ),
        ),
      ],
    );
  }

  Widget boardingTextWidget(String abb, String text, [bool isRed = false]) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            abb,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isRed ? const Color(0xffB71E2F) : const Color(0xff667085),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isRed ? const Color(0xffB71E2F) : null,
            ),
          ),
        ],
      ),
    );
  }
}
