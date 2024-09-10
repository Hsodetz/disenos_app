import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> opacityFadeOut;
  late Animation<double> moveToRight;
  late Animation<double> larger;


  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));

    // El math.pi son 180 grados, osea que aqui le diriamos que de unas dos vueltas
    // rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(animationController);

    // Ahora aplicaremos una animacion con curves, para tener ese tipo de animacion https://easings.net/en
    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: animationController, curve: Curves.bounceOut)
    );

    // De esta manera aplicamos una apacidad que dura el tiempo de la animacion
    // opacity = Tween(begin: 0.1, end: 1.0).animate(animationController);

    // Ahora haremos una opacidad que dura el tiempo que querramos dentro del tiempo de la animacion
    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
          parent: animationController,
          // Interval(0, 0.25) indica que empieza en 0 y termina en la 4ta parte del tiempo indicado en la animacion, que para este ejemplo es 4 segundos
          curve: const Interval(0, 0.25, curve: Curves.easeOut)
      ),
    );

    opacityFadeOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: animationController,
          curve: const Interval(0.75, 1.0, curve: Curves.easeOut)
      ),
    );

    moveToRight = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    // Cion este hacemos mas grande el rectangulo, le elevamos la escala a dos veces su tamano
    larger = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    animationController.addListener(() { 
      print('status: ${animationController.status}');

      if(animationController.status == AnimationStatus.completed) {
        animationController.reverse();
        // animationController.reset();

      }
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

    return AnimatedBuilder(
        animation: animationController,
        child: const _Rectangulo(),
        builder: (context, childRectangle) {

          print('opacidad: ${opacity.status}');
          print('opacidad: ${opacity.value}');

          print('rotacion: ${rotation.status}');
          print('opacidad: ${opacity.value}');


          return Transform.translate(
            offset: Offset(moveToRight.value, 0),
            child: Transform.rotate(
                angle: rotation.value,
                child: Opacity(
                  opacity: opacity.value - opacityFadeOut.value,
                  child: Transform.scale(
                    scale: larger.value,
                    child: childRectangle
                  ),
                )
            ),
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
        color: Colors.blue,
      ),
    );
  }
}


