import 'dart:ffi';

import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: _CuadradoAnimado()),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({super.key});
  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> moveToRight;
  late Animation moveToUp;
  late Animation moveToLeft;
  late Animation moveToDown;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 4500));

    moveToRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0, 0.25, curve: Curves.bounceOut)),
    );

    moveToUp = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: animationController,  curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)),
    );

    moveToLeft = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: animationController,  curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)),
    );

    moveToDown = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: animationController,  curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)),
    );


    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) animationController.repeat();

      print(animationController.value);
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Play / Reproducción
    animationController.forward();

    print(Offset(moveToRight.value + moveToLeft.value, moveToUp.value + moveToDown.value));

    return AnimatedBuilder(
      animation: animationController,
      child: const _Rectangulo(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moveToRight.value + moveToLeft.value, moveToUp.value + moveToDown.value),
          child: child,
        );
      },
    );
  }
}




class _Rectangulo extends StatelessWidget {
  const _Rectangulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
    );
  }
}
