import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/auth/signInScreen.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/auth/signUpScreen.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/daily-quiz/daily-quiz.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/dashboard/home.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/exam_module/exam_module.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/introSliderScreen.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/splashScreen.dart';
// import 'package:pal_prashnotarri_teacher/utils/stringLabels.dart';

class Routes {
  static const home = "/";
  static const login = "login";
  static const splash = 'splash';
  static const signUp = "signUp";
  static const introSlider = "introSlider";
  static const dailyQuiz = "dailyQuiz";
  static const exammodule = "examModule";

  static String currentRoute = splash;

  static Route<dynamic> onGenerateRouted(RouteSettings routeSettings) {
    //to track current route
    //this will only track pushed route on top of previous route
    currentRoute = routeSettings.name ?? "";
    print("Current Route is $currentRoute");
    switch (routeSettings.name) {
      case splash:
        return CupertinoPageRoute(builder: (context) => SplashScreen());
      case home:
        return HomeScreen.route(routeSettings);
      case introSlider:
        return CupertinoPageRoute(builder: (context) => IntroSliderScreen());
      case login:
        return CupertinoPageRoute(builder: (context) => SignInScreen());
      case signUp:
        return CupertinoPageRoute(builder: (context) => SignUpScreen());
      case dailyQuiz:
        return DailyQuiz.route(routeSettings);
      case exammodule:
        return ExamModule.route(routeSettings);

      default:
        return CupertinoPageRoute(builder: (context) => Scaffold());
    }
  }
}
