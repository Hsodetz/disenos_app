import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ButtonFat extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colorGradientOne;
  final Color colorGradientTwo;
  final VoidCallback onPress;

  const ButtonFat({super.key,
    required this.icon,
    required this.text,
    this.colorGradientOne = const Color(0xff67ACF2),
    this.colorGradientTwo = const Color(0xff526BF6),
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          _ButtonFatBackground(colorGradientOne: colorGradientOne, colorGradientTwo: colorGradientTwo, icon: icon,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 40,),
              FaIcon(icon, color: Colors.white, size: 40,),
              const SizedBox(width: 20,),

              Expanded(child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.5)))),
              const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white, size: 30,),
              const SizedBox(width: 40,),
            ],
          )
        ],
      ),
    );
  }
}

class _ButtonFatBackground extends StatelessWidget {
  final IconData icon;
  final Color colorGradientOne;
  final Color colorGradientTwo;

  const _ButtonFatBackground({
    super.key,
    required this.colorGradientOne,
    required this.colorGradientTwo,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: const Offset(
              4.0,
              6.0,
            ),
            blurRadius: 6.0,
            // spreadRadius: 2.0
          ),
        ],
        gradient: LinearGradient(
          colors: <Color>[
            colorGradientOne,
            colorGradientTwo,
          ],
        ),
      ),

      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon, size: 150, color: Colors.white.withOpacity(0.2),)
            ),
          ],
        ),
      ),
    );
  }
}
