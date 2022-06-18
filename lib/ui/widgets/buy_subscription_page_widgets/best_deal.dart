import 'package:flutter/material.dart';

class BestDeal extends StatelessWidget {
  const BestDeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 20,
      decoration: BoxDecoration(
        color: const Color(0xFF6975E9),
        border: Border.all(color: const Color(0xFF6975E9)),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: const Center(
        child: Text(
          'Best deal',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
