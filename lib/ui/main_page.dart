import 'package:ad_blocker/ui/pages/block_page.dart';
import 'package:ad_blocker/ui/pages/filters_page.dart';
import 'package:ad_blocker/ui/pages/home_page.dart';
import 'package:ad_blocker/ui/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final tabItems = ['home', 'block', 'filter', 'settings'];

  @override
  Widget build(BuildContext context) {
    final color = TabBarTheme.of(context).labelColor!;
    final int currentIndex = widget.tabController.index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TabBar(
            onTap: (index) {
              setState(() {});
            },
            controller: widget.tabController,
            indicatorPadding: const EdgeInsets.only(bottom: 10),
            unselectedLabelColor: Colors.red,
            tabs: List.generate(
              4,
              (index) => Tab(
                  icon: SvgPicture.asset(
                'assets/icons/${tabItems[index]}.svg',
                color: currentIndex == index ? color : null,
              )),
              growable: false,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
