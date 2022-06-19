import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsTile extends StatelessWidget {
  final String name;
  final String iconName;
  final Color mainColor;
  final Function() onTap;

  const SettingsTile({
    Key? key,
    required this.name,
    required this.iconName,
    required this.mainColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  boxShadow: [
                    BoxShadow(
                      color: mainColor.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.2),
                      offset: const Offset(0, -3),
                      blurRadius: 6,
                    ),
                    BoxShadow(
                      color: const Color(0xFFFFFFFF).withOpacity(0.8),
                      offset: const Offset(0, -1),
                      blurRadius: 7,
                    ),
                  ]),
              child: Center(
                child: SvgPicture.asset('assets/icons/$iconName.svg'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF3D3D3D),
                ),
              ),
            ),
            SvgPicture.asset('assets/icons/chevron_right.svg')
          ],
        ),
      ),
    );
  }
}