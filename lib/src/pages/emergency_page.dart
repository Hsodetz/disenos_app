import 'package:animate_do/animate_do.dart';
import 'package:disenos_app/src/widgets/emergencylayout_widgets/button_fat.dart';
import 'package:disenos_app/src/widgets/emergencylayout_widgets/icon_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemButton {

  final IconData icon;
  final String text;
  final Color colorGradientOne;
  final Color colorGradientTwo;


  ItemButton( this.icon, this.text, this.colorGradientOne, this.colorGradientTwo );
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {

    final items = <ItemButton>[
      new ItemButton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemButton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemButton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemButton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemButton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemButton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemButton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemButton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    ];

    final itemMap = items.map((e) => FadeInLeft(
      duration: const Duration(milliseconds: 400),
      child: ButtonFatTemp(
        icon: e.icon,
        colorGradientOne: e.colorGradientOne,
        colorGradientTwo: e.colorGradientTwo,
        text: e.text,
        onPress: () => print(e.text),
      ),
    ));


    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 300),
            child: ListView(
              // El physics: const BouncingScrollPhysics() es para que en android tenga el mismo comportamiento que en ios
              physics: const BouncingScrollPhysics(),
              children: [
                ...itemMap
              ],

            ),
          ),

          const _Header()
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia Médica xxx',
          subTitle: 'Has Solicitado',
        ),

        Positioned(
          right: 10,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15.0),
            child: const FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,),
          ),
        )
      ],
    );
  }
}

class ButtonFatTemp extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPress;
  final Color colorGradientOne;
  final Color colorGradientTwo;

  const ButtonFatTemp({
    super.key,
    required this.icon,
    required this.text,
    required this.onPress,
    required this.colorGradientOne,
    required this.colorGradientTwo,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonFat(
      icon: icon,
      text: text,
      onPress: onPress,
      colorGradientOne: colorGradientOne,
      colorGradientTwo: colorGradientTwo,
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      title: 'Has Solicitado',
      subTitle: 'Asistencia Médica',
      icon: FontAwesomeIcons.plus,
    );
  }
}
