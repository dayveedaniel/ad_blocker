import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionTile extends StatelessWidget {
  final String name;
  final List<Color> gradientColors;
  final Color dropShadowColor;

  const OptionTile({
    Key? key,
    required this.name,
    required this.gradientColors,
    required this.dropShadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String iconName = name.toLowerCase();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColors,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    boxShadow: [
                      BoxShadow(
                        color: dropShadowColor.withOpacity(0.25),
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
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withOpacity(0.0),
                      const Color(0xFFC4C4C4).withOpacity(0.5),
                    ],
                    radius: 0.85,
                    focal: Alignment.center,
                    focalRadius: 0.4,
                  ),
                ),
              ),
            ],
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
          Switch(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: true,
            onChanged: (bool isActive) {},
          ),
        ],
      ),
    );
  }
}
