import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color colorGradientOne;
  final Color colorGradientTwo;

  const IconHeader({super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.colorGradientOne = const Color(0xff526BF6),
    this.colorGradientTwo = const Color(0xff67ACF2),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(colorGradientOne: colorGradientOne, colorGradientTwo: colorGradientTwo,),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(icon, size: 250, color: Colors.white.withOpacity(0.2),)
        ),
        
        Align(
          child: Column(
            children: [
              const SizedBox(height: 80,),
              Text(title, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.2))),
              const SizedBox(height: 20,),
              Text(subTitle, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.2))),
              const SizedBox(height: 20,),
              FaIcon(icon, size: 85, color: Colors.white,)
            ],
          ),
        )
        
      ],
      
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color colorGradientOne;
  final Color colorGradientTwo;

  const _IconHeaderBackground({
    super.key, required this.colorGradientOne, required this.colorGradientTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      //color: Colors.blueGrey,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(100)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            colorGradientOne,
            colorGradientTwo,
          ],
        ),
      ),
    );
  }
}
