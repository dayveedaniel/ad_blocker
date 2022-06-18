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
    );
  }
}
