import 'package:flight_ticket_animation/widgets/sizer_box_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/flight_widget/flight_details_widget.dart';
import '../widgets/flight_widget/travel_title_and_logo_widget.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    offset = Tween(
      begin: const Offset(0, -1),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: SlideTransition(
            position: offset,
            child: Container(
              margin: EdgeInsets.only(top: 40.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0.r),
                border: Border.all(color: const Color(0xffEFF0F3)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 20.0,
                    spreadRadius: 0.0,
                    offset: const Offset(5.0, 5.0),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}



// new Container(
//   width: 100,
//   height: 100,
//   decoration: new BoxDecoration(
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(.5),
//         blurRadius: 20.0, // soften the shadow
//         spreadRadius: 0.0, //extend the shadow
//         offset: Offset(
//           5.0, // Move to right 10  horizontally
//           5.0, // Move to bottom 10 Vertically
//         ),
//       )
//     ],
//   ),
// ),