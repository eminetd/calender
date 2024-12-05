// ignore_for_file: prefer_const_constructors

import 'package:calender/router/app_router.dart';
import 'package:calender/routes/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MyAppRouter appRouter = MyAppRouter();
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light
      ),
      initialRoute: Routes.home,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

