import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BatmanCity extends AnimatedWidget {

  BatmanCity(Animation animation ) : super (listenable: animation);

  Animation  get _animationCity => listenable as Animation;

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

    return   ClipPath(
      clipper: _CityClipper(_animationCity.value),
      child: Image.asset(
        'images/batmancity.png',
        height: 350.h,
        width: 400.w,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _CityClipper extends CustomClipper <Path> {

  final double progress;

  _CityClipper(this.progress);


  @override
  Path getClip( Size size) {

    final path = Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width /2, size.height * (1 - progress));
    path.lineTo(0.0, size.height);
    return path;
    
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}