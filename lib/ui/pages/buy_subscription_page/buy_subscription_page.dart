import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/general_widgets/custom_app_bar.dart';

class BuySubscriptionPage extends StatelessWidget {
  const BuySubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarText: 'Premium Anti-A',
        appBarAction: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(height: 57),
            Text(
              'How to enable Anti-Ads in\n Safari:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 30),
            InstructionStep(text: 'Control Privacy & Stop Pops'),
            SizedBox(height: 9),
            InstructionStep(text: 'Advanced AdBlocker'),
            SizedBox(height: 9),
            InstructionStep(text: 'Accelerate Your Device'),
            SizedBox(height: 9),
            InstructionStep(text: 'Save Bettery & Mobile Data')
          ],
        ),
      ),
    );
  }
}

class InstructionStep extends StatelessWidget {
  final String text;

  const InstructionStep({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/point.svg'),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000).withOpacity(0.6),
          ),
        )
      ],
    );
  }
}
