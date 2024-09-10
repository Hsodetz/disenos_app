import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));

    animationController.addListener(() {
      print('animationController: ${animationController.value}');

      setState(() {
        // El lerpDouble hace como una interpolacion y saca como la media juanto al porcentaje que es el ultimo argumento
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, animationController.value)!;
      });

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
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          //color: Colors.deepOrange,
          child: CustomPaint(painter: _MyRadialProgress(porcentaje: porcentaje),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {

          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if(nuevoPorcentaje > 100) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }

          animationController.forward(from: 0);

          setState(() {
          });


        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter{
  final porcentaje;

  _MyRadialProgress({required this.porcentaje});


  @override
  void paint(Canvas canvas, Size size) {

    // Circulo completado
    final paint = Paint()
        ..strokeWidth = 5
        ..color = Colors.grey
        ..style = PaintingStyle.stroke;

    final c = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    // Ahora para trazar el circulo podemos usar el siguiente canvas
    canvas.drawCircle(c, radius, paint);

    // Arco
    final paintArco = Paint()
      ..strokeWidth = 8
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;

    // Parte que se debera ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArco
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
