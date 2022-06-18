import 'package:flutter/material.dart';

class DocumentsButtons extends StatelessWidget {
  const DocumentsButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidthCoefficient = MediaQuery.of(context).size.width / 375;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextButton(
          text: 'Privacy Policy',
          onTap: () {},
        ),
        SizedBox(width: 22 * screenWidthCoefficient),
        CustomTextButton(
          text: 'Terms of Use',
          onTap: () {},
        )
      ],
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFF000000).withOpacity(0.5),
          fontSize: 12,
        ),
      ),
    );
  }
}
