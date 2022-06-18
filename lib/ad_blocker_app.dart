import 'package:ad_blocker/ui/main_page.dart';
import 'package:ad_blocker/ui/widgets/tab_bar_indicator.dart';
import 'package:ad_blocker/navigation/app_navigation.dart';
import 'package:ad_blocker/navigation/route_names.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteNames.buySubscriptionPage,
      routes: AppNavigation.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF5F5F5),
        //primarySwatch:MaterialColor(0xffD9D9D9),
        tabBarTheme: TabBarTheme(
          labelColor: const Color(0xff5D6CF0),
          indicatorSize: TabBarIndicatorSize.label,
          indicator:
              CircleTabIndicator(color: const Color(0xff5D6CF0), radius: 3),
          unselectedLabelColor: const Color(0xffD9D9D9),
          //labelPadding: EdgeInsets.only(bottom: 50),
        ),
      ),
    );
  }
}
