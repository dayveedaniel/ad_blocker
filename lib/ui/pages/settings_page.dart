import 'package:ad_blocker/ui/widgets/general_widgets/custom_app_bar.dart';
import 'package:ad_blocker/ui/widgets/general_widgets/custom_divider.dart';
import 'package:flutter/material.dart';

import '../../navigation/route_names.dart';
import '../widgets/settings_page_widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarText: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SettingsTile(
                  name: 'Get Premium',
                  iconName: 'get_premium',
                  mainColor: const Color(0xFF5D6CF0),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(RouteNames.buySubscriptionPage);
                  },
                ),
                const CustomDivider(),
                SettingsTile(
                  name: 'Setup Training',
                  iconName: 'setup_training',
                  mainColor: const Color(0xFF858585),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(RouteNames.setupTrainingPage);
                  },
                ),
                const CustomDivider(),
                SettingsTile(
                  name: 'Terms of Use',
                  iconName: 'terms_of_use',
                  mainColor: const Color(0xFFB99AE4),
                  onTap: () {},
                ),
                const CustomDivider(),
                SettingsTile(
                  name: 'Privacy Policy',
                  iconName: 'privacy_policy',
                  mainColor: const Color(0xFFDADE21),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
