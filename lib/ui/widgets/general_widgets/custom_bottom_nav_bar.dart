
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
