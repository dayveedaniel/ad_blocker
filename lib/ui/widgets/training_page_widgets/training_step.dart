import 'package:flutter/material.dart';

class TrainingStep extends StatelessWidget {
  final String text;
  final String iconName;

  const TrainingStep({
    Key? key,
    required this.text,
    required this.iconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/icons/png_icons/$iconName.png'),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
