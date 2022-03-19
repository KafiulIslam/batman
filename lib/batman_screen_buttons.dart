import 'package:bat_man/common_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BatmanScreenButtons extends AnimatedWidget {
  // const BatmanScreenButtons({Key? key}) : super(key: key);


   BatmanScreenButtons(Animation animation, this.onTap ) : super (listenable: animation);

   final VoidCallback onTap;

   Animation  get _animationButtonsIn => listenable as Animation;



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
      opacity: _animationButtonsIn.value,
      child: Transform.translate(
        offset: Offset(
            0.0, 100 * (1 - _animationButtonsIn.value).toDouble() ),
        child: Column(
          children: [
            CommonButton(
              buttonTitle: 'Sign In',
              onTap: () {
                Navigator.pop(context, false);
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CommonButton(
              buttonTitle: 'Sign Up',
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
