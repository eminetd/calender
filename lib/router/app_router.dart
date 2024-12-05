import 'package:calender/home_page.dart';
import 'package:calender/month.dart';
import 'package:calender/routes/route.dart';
import 'package:flutter/material.dart';


class MyAppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.months:
        final Map<String, dynamic>? arguments =
            settings.arguments as Map<String, dynamic>?;
       
        final String selectedDay = arguments?['selectedDay'];
        final int selectedIndex = arguments?['selectedIndex'];
        final int countDays = arguments?['countDays'];
        return MaterialPageRoute(
          builder: (_) => Months(
            getindex: selectedIndex,
            selectedDay: selectedDay,
            countDays: countDays,
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
