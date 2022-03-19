import 'package:flutter/material.dart';
import 'package:bat_man/common_classes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BatmanScreenSignUpIn extends AnimatedWidget {
  // const BatmanScreenButtons({Key? key}) : super(key: key);


  BatmanScreenSignUpIn(Animation animation ) : super (listenable: animation);



  Animation  get _animationSignUpIn => listenable as Animation;



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
      opacity: _animationSignUpIn.value,
      child: Transform.translate(
        offset: Offset(
            0.0, 100 * (1 - _animationSignUpIn.value).toDouble() ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text('Get Access', style: GoogleFonts.lobster(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.sp,
                  color: Colors.white,
                ),
              )),
              SizedBox(
                height: 32.h,
              ),
              const _BatmanInput(label: 'Full Name'),
              SizedBox(
                height: 16.h,
              ),
              const _BatmanInput(label: 'Email Address'),
              SizedBox(
                height: 16.h,
              ),
              const _BatmanInput(label: 'Password',password: true,),
              SizedBox(
                height: 16.h,
              ),
              CommonButton(
                buttonTitle: 'Sign Up',
               onTap: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _BatmanInput extends StatelessWidget {

  final String label;
  final bool password;

  const _BatmanInput({Key? key, required this.label,  this.password = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.0,
      ),
    );
    return Padding(
      padding:   EdgeInsets.only(left: 32.w,right: 32.w),
      child: Container(
        height: 60.h,width: double.infinity,
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: password ? Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:   EdgeInsets.only(right: 16.w),
                child: Image.asset(
                  'images/batmanlogo.png',
                  height: 40.h,
                  width: 80.w,
                  fit: BoxFit.contain,
                ),
              ),
            ) : null,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(
              fontSize: 25.sp,
              color: Colors.grey,

            ),
            enabledBorder: border,
            border:  border,
          ),
        ),
      ),
    );
  }
}

