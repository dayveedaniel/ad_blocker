import 'package:ad_blocker/navigation/route_names.dart';
import 'package:ad_blocker/ui/pages/block_page.dart';
import 'package:ad_blocker/ui/pages/buy_subscription_page/buy_subscription_page.dart';
import 'package:ad_blocker/ui/pages/buy_subscription_page/buy_subscription_page_cubit.dart';
import 'package:ad_blocker/ui/pages/filters_page.dart';
import 'package:ad_blocker/ui/pages/home_page.dart';
import 'package:ad_blocker/ui/pages/settings_page.dart';
import 'package:ad_blocker/ui/pages/setup_training_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/main_page.dart';

class AppNavigation {
  static final routes = <String, Widget Function(BuildContext)>{
    RouteNames.mainPage: (context) => const MainPage(),
    RouteNames.homePage: (context) => const HomePage(),
    RouteNames.blockPage: (context) => const BlockPage(),
    RouteNames.filtersPage: (context) => const FiltersPage(),
    RouteNames.settingsPage: (context) => const SettingsPage(),
    RouteNames.setupTrainingPage: (context) => const SetupTrainingPage(),
    RouteNames.buySubscriptionPage: (context) =>
        BlocProvider<BuySubscriptionPageCubit>(
          create: (context) => BuySubscriptionPageCubit(),
          child: const BuySubscriptionPage(),
        ),
  };
}
