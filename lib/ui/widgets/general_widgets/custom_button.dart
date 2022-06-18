import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeightCoefficient = MediaQuery.of(context).size.height / 812;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xFF6975E9),
                blurRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF5C6AEF),
                Color(0xFF707CE7),
              ],
            ),
          ),
          constraints: BoxConstraints(
            minHeight: 68 * screenHeightCoefficient,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
