import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../dash_line_widget.dart';
import '../sizer_box_helper.dart';

class TravelDetailsWidget extends StatelessWidget {
  const TravelDetailsWidget({Key? key}) : super(key: key);

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
                        locationTextWidget('ABV', 'Abuja'),
                        flightPathIcon(),
                        locationTextWidget('LHR', 'London'),
                      ],
                    ),
                    const H(height: 15),
                    Row(
                      children: [
                        boardingTextWidget('Boarding Date', 'Aug 12, 2022'),
                        boardingTextWidget('Boarding Time', '9:30am', true),
                      ],
                    ),
                    const H(height: 15),
                    Row(
                      children: [
                        boardingTextWidget('Gate', 'J22'),
                        boardingTextWidget('Seat', '19J'),
                        boardingTextWidget('Flight No.', 'DN2903'),
                        boardingTextWidget('Luggage', '3 Y'),
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

  Widget flightPathIcon() {
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
          Container(
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
        ],
      ),
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
