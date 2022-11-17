import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../sizer_box_helper.dart';

class TravelTitleAndLogoWidget extends StatelessWidget {
  const TravelTitleAndLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.network('assets/logo.svg', height: 50.h, width: 50.w),
        const H(height: 20),
        Column(
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
        const H(height: 48),
      ],
    );
  }
}
