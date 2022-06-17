import 'package:ad_blocker/ui/widgets/general_widgets/custom_app_bar.dart';
import 'package:ad_blocker/ui/widgets/main_screen_widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarText: 'Internet AdBlocker',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                MediaQuery.of(context).size.width * 0.262,
                MediaQuery.of(context).size.width * 0.262,
              ),
              shape: const CircleBorder(),
              primary: const Color(0xFFB9B9B9),
            ),
            child: SvgPicture.asset('assets/icons/on.svg'),
          ),
          const SizedBox(height: 98),
          const Text(
            'Not active',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFD83B3B),
              fontSize: 26,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: "Your device is ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'not secured',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
