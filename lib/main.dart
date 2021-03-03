import 'package:flutter/material.dart';
import 'package:flutter_furniture_2/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Metropplis",
      ),
      builder: (context, child) {
        // Helps us to scale our app for different screen sizes
        ScreenUtil.init(context,
            height: 812.0, width: 377.0, allowFontScaling: true);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child,
        );
      },
      home: HomePage(),
    );
  }
}
