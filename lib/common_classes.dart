import 'package:bat_man/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constant_page.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
class CommonButton extends StatefulWidget {

  final String buttonTitle;
  final VoidCallback onTap;
  // final bool left ;
  const CommonButton({Key? key, required this.buttonTitle,required this.onTap   }) : super(key: key);

  @override
  _CommonButtonState createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
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

    return Padding(
      padding:   EdgeInsets.only(left: 32.w, right: 32.w),
      child: Material(
        color: Colors.yellow,
        child: InkWell(
          onTap: widget.onTap,
          child: SizedBox(

            height: 60.h,width: double.infinity,

            child:     Center(
              child: Text(widget.buttonTitle,style: TextStyle(
                  fontSize: 25.sp, color: black,fontWeight: FontWeight.bold
              ),),
            ),
            // Stack(
            //   children: [
            //   if(widget.left)
            //
            //        Align(
            //          alignment: Alignment.centerLeft,
            //          child: Transform(
            //               alignment: Alignment.center,
            //               transform: Matrix4.identity()..translate(-10)..rotateZ(vector.radians(35)),
            //     child: Image.asset('images/batmanlogo.png',height: 32.h,color: const Color(0xFFC8B853), )),
            //        ) ,
            //
            //
            //
            //     Center(
            //       child: Text(widget.buttonTitle,style: TextStyle(
            //       fontSize: 25.sp, color: black,fontWeight: FontWeight.bold
            // ),),
            //     ),
            //   ]
            //   ),
            ),
          ),
      ),
      );

  }
}


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CommonButton(buttonTitle: 'Welcome', onTap: ( ){
            Navigator.push(context,MaterialPageRoute(builder: (context) => const WelcomeScreen()));
          }),
        ),
      ),
    );
  }
}





