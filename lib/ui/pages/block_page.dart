import 'package:ad_blocker/ui/widgets/general_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/general_widgets/custom_divider.dart';
import '../widgets/block_page_widgets/option_tile.dart';

class BlockPage extends StatelessWidget {
  const BlockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarText: 'Block rules'),
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
              children: const [
                OptionTile(
                  name: 'Ads',
                  dropShadowColor: Color(0xFFCA4040),
                  gradientColors: [
                    Color(0xFFFF5834),
                    Color(0xFFFF3761),
                  ],
                ),
                CustomDivider(),
                OptionTile(
                  name: 'Fonts',
                  dropShadowColor: Color(0xFF3288D7),
                  gradientColors: [
                    Color(0xFF6FAFEA),
                    Color(
                      0xFF32A5D7,
                    )
                  ],
                ),
                CustomDivider(),
                OptionTile(
                  dropShadowColor: Color(0xFF49D732),
                  name: 'Images',
                  gradientColors: [
                    Color(0xFF84D732),
                    Color(0xFF49D732),
                  ],
                ),
                CustomDivider(),
                OptionTile(
                  dropShadowColor: Color(0xFFD732C6),
                  name: 'Adult',
                  gradientColors: [
                    Color(0xFFEC55DC),
                    Color(0xFFD732C6),
                  ],
                ),
                CustomDivider(),
                OptionTile(
                  dropShadowColor: Color(0xFFDF8939),
                  name: 'Malware',
                  gradientColors: [
                    Color(0xFFFFAE34),
                    Color(0xFFFF7337),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
