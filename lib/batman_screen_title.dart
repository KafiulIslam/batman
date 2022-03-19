import 'package:bat_man/common_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BatmanScreenTitle extends AnimatedWidget {
  // const BatmanScreenButtons({Key? key}) : super(key: key);


  BatmanScreenTitle(Animation animation ) : super (listenable: animation);

  Animation  get _animationLogoMovementUp => listenable as Animation;



  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(414, 896),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    return  Opacity(
      opacity: _animationLogoMovementUp.value,
      child: Column(
        children: [
          Text(
            'Welcome To',
            style: GoogleFonts.lobster(
                textStyle: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          Text(
            'Bangladesh',
            style: GoogleFonts.lobster(
              textStyle: TextStyle(
                  fontSize: 45.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
