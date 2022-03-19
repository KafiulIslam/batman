import 'package:bat_man/batman_city.dart';
import 'package:bat_man/batman_screen_buttons.dart';
import 'package:bat_man/batman_screen_sign_up.dart';
import 'package:bat_man/batman_screen_title.dart';
import 'package:bat_man/common_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },

        theme: ThemeData(
          textTheme: TextTheme(
              //To support the following, you need to use the first initialization method
              button: TextStyle(fontSize: 45.sp)),
        ),
        // A widget which will be started on application startup
        home: const WelcomeScreen(),
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {


  late AnimationController _animationController;
  late Animation<double> _animationLogoIn;
  late Animation<double> _animationLogoMovementUp;
  late Animation<double> _animationBatmanIn;
  late Animation<double> _animationButtonsIn;

  late AnimationController _animationControllerSignUp;
  late Animation<double> _animationLogoOut;
  late Animation<double> _animationBatmanUp;
  late Animation<double> _animationBatmanCity;
  late Animation<double> _animationSignUpIn;

  void _setUpFirstAnimation (){
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    _animationLogoIn = Tween(begin: 35.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 0.25)));

    _animationLogoMovementUp = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.30, 0.50));

    _animationBatmanIn = Tween(begin: 5.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.50, 1.0, curve: Curves.decelerate)));

    _animationButtonsIn = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.55, 1.0,curve: Curves.easeIn));


    _animationController.forward();
  }

  void _setUpSecondAnimation(){
    _animationControllerSignUp =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));

    _animationLogoOut = CurvedAnimation(
        parent: _animationControllerSignUp, curve: const Interval(0.0, 0.20));

    _animationBatmanUp = CurvedAnimation(
        parent: _animationControllerSignUp, curve: const Interval(0.30, 0.45));

    _animationBatmanCity = CurvedAnimation(
        parent: _animationControllerSignUp, curve: const Interval(0.45, 0.60));

    _animationSignUpIn = CurvedAnimation(
        parent: _animationControllerSignUp, curve: const Interval(0.60, 1.0));
  }

  void _onSignUp (){
    _animationControllerSignUp.forward(from: 0.0);
  }

  @override
  void initState() {

_setUpFirstAnimation();
_setUpSecondAnimation();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignUp.dispose();
    super.dispose();
  }

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

    return GestureDetector(
      onTap: () {
        // _animationController.forward(from: 0.0);
        // _animationControllerSignUp.reset();
      },
      child: AnimatedBuilder(
          animation: Listenable.merge([_animationController, _animationControllerSignUp]),
          builder: (context, _) {
            return Scaffold(
              backgroundColor: Colors.black,

              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'images/batmanback.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 20.h,
                    left: 0,
                    right: 0,
                    child:
                    // Transform.translate(
                    //   offset:   Offset(0.0,60.h * _animationLogoOut.value    ),
                    //   child:
                      Transform.scale(
                          scale: _animationBatmanIn.value,
                          child: Image.asset(
                            'images/batman.png',
                            fit: BoxFit.contain,
                          ),),
                    ),
                  Positioned(
                    top: 180.h,
                    left: 0,
                    right: 0,
                    child:
                   BatmanCity(_animationBatmanCity),
                  ),
                  Positioned(
                    top: 480.h,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child:
                   BatmanScreenSignUpIn(_animationSignUpIn),
                  ),
                  Positioned(
                      top: 450.h,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Transform.translate(
                            offset:   Offset(0.0,60.h * _animationLogoOut.value),
                            child: Opacity(
                                opacity: (1 - _animationLogoOut.value),
                                child: BatmanScreenTitle(_animationLogoMovementUp)),
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                          Transform.translate(
                            offset:   Offset(0.0,60.h * _animationLogoOut.value),
                            child: Opacity(
                                opacity: (1 - _animationLogoOut.value),
                                child: BatmanScreenButtons(_animationButtonsIn, _onSignUp)),
                          ),

                        ],
                      )),
                  Positioned(
                    top: 350.h - 100.h * _animationLogoMovementUp.value,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: (1 - _animationLogoOut.value),
                      child: Transform.scale(
                          scale: _animationLogoIn.value,
                          child: Image.asset(
                            'images/batmanlogo.png',
                            height: 150.h,
                            width: 300.w,
                            fit: BoxFit.contain,
                          )),
                    ),
                  ),
                ],
              ),
              // This trailing comma makes auto-formatting nicer for build methods.
            );
          }),
    );
  }
}
