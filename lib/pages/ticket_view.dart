import 'package:flight_ticket_animation/widgets/sizer_box_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/flight_widget/flight_details_widget.dart';
import '../widgets/flight_widget/travel_title_and_logo_widget.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Container(
            margin: EdgeInsets.only(top: 40.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0.r),
              border: Border.all(color: const Color(0xffEFF0F3)),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  W(width: double.infinity),
                  TravelTitleAndLogoWidget(),
                  TravelDetailsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
