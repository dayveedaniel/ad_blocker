import 'package:ad_blocker/ui/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
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
            key: firstTabNavKey,
            onPopPage: (route, result) {
              return true;
            },
            pages: [
              MaterialPage(child: HomePage()),
            ],
          ),
          Navigator(),
          Navigator(),
          Navigator(),
        ],
      ),
      bottomNavigationBar: Column(
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
              indicatorPadding: const EdgeInsets.only(bottom: 9),
              unselectedLabelColor: Colors.red,
              tabs: [
                Tab(icon: SvgPicture.asset('assets/icons/home.svg')),
                Tab(icon: SvgPicture.asset('assets/icons/block.svg')),
                Tab(icon: SvgPicture.asset('assets/icons/filter.svg')),
                Tab(icon: SvgPicture.asset('assets/icons/settings.svg')),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
