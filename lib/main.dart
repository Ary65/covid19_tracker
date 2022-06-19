import 'package:covid19_tracker/constants/colors.dart';
import 'package:covid19_tracker/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Covid-19 Tracker',
          theme: ThemeData.dark().copyWith(
            useMaterial3: true,
            scaffoldBackgroundColor: kBackgroundColor,
            primaryColor: kPrimaryColor,
          ),

          // themeMode: ThemeMode.dark,
          // darkTheme: Theme.of(context).copyWith(
          //   platform: TargetPlatform.android,
          //   scaffoldBackgroundColor: kBackgroundColor,
          //   primaryColor: kPrimaryColor,
          //   canvasColor: kBackgroundColor,
          // ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
