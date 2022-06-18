import 'package:ad_blocker/ui/pages/block_page.dart';
import 'package:ad_blocker/ui/pages/filters_page.dart';
import 'package:ad_blocker/ui/pages/home_page.dart';
import 'package:ad_blocker/ui/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'widgets/general_widgets/custom_bottom_nav_bar.dart';

final firstTabNavKey = GlobalKey<NavigatorState>();
final secondTabNavKey = GlobalKey<NavigatorState>();
final thirdTabNavKey = GlobalKey<NavigatorState>();
final forthTabNavKey = GlobalKey<NavigatorState>();

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          Navigator(
            // key: firstTabNavKey,
            //initialRoute: RouteNames.homePage,
            pages: [MaterialPage(child: HomePage())],
            onPopPage: (route, result) {
              return true;
            },
          ),
          Navigator(
            pages: [MaterialPage(child: BlockPage())],
            onPopPage: (route, result) {
              return true;
            },
          ),
          Navigator(
            pages: [MaterialPage(child: FiltersPage())],
            onPopPage: (route, result) {
              return true;
            },
          ),
          Navigator(
            pages: [MaterialPage(child: SettingsPage())],
            onPopPage: (route, result) {
              return true;
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(tabController: tabController),
    );
  }
}
