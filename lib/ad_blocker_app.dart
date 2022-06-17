import 'package:ad_blocker/ui/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';

import 'ui/pages/buy_subscription_page/buy_subscription_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BuySubscriptionPage(),
    );
  }
}
