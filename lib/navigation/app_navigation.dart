import 'package:ad_blocker/navigation/route_names.dart';
import 'package:ad_blocker/ui/pages/buy_subscription_page/buy_subscription_page.dart';
import 'package:ad_blocker/ui/pages/buy_subscription_page/buy_subscription_page_cubit.dart';
import 'package:ad_blocker/ui/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigation {
  static final routes = <String, Widget Function(BuildContext)>{
    RouteNames.mainPage: (context) => const MainPage(),
    RouteNames.buySubscriptionPage: (context) =>
        BlocProvider<BuySubscriptionPageCubit>(
          create: (context) => BuySubscriptionPageCubit(),
          child: const BuySubscriptionPage(),
        ),
  };
}
