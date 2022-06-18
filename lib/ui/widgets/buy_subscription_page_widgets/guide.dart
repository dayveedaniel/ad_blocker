import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Guide extends StatelessWidget {
  const Guide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeightCoefficient = MediaQuery.of(context).size.height / 812;

    return Padding(
      padding: const EdgeInsets.only(left: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How to enable Anti-Ads in\n Safari:',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 25 * screenHeightCoefficient),
          const InstructionStep(text: 'Control Privacy & Stop Pops'),
          const SizedBox(height: 9),
          const InstructionStep(text: 'Advanced AdBlocker'),
          const SizedBox(height: 9),
          const InstructionStep(text: 'Accelerate Your Device'),
          const SizedBox(height: 9),
          const InstructionStep(text: 'Save Bettery & Mobile Data')
        ],
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
      mainAxisAlignment: MainAxisAlignment.start,
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
