import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final double porcentaje;
  final Color colorPrimary;
  final Color colorSecondary;
  final double thicknessPrimary;
  final double thicknessSecondary;

  const RadialProgress({
    super.key,
    required this.porcentaje,
    this.colorPrimary = Colors.blue,
    this.colorSecondary = Colors.grey,
    this.thicknessPrimary = 4.0,
    this.thicknessSecondary = 2.0,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

  AnimationController? controller;
  double porcentajeAnterior = 0.0;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller?.forward(from: 0.0);

    final difAnimation = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller!,
      builder: (context, child) {
        return Container(
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _MyRadialProgress(
            porcentaje: (widget.porcentaje - difAnimation) + (difAnimation * controller!.value),
            colorPrimary: widget.colorPrimary,
            colorSecondary: widget.colorSecondary,
            thicknessPrimary: widget.thicknessPrimary,
            thicknessSecondary: widget.thicknessSecondary,
          ),
        ),
    );
      },
    );

    
  }
}

class _MyRadialProgress extends CustomPainter{
  final porcentaje;
  final Color colorPrimary;
  final Color colorSecondary;
  final double thicknessPrimary;
  final double thicknessSecondary;

  _MyRadialProgress({
    required this.porcentaje,
    required this.colorPrimary,
    required this.colorSecondary,
    required this.thicknessPrimary,
    required this.thicknessSecondary,
  });


  @override
  void paint(Canvas canvas, Size size) {

    // Circulo completado
    final paint = Paint()
        ..strokeWidth = thicknessSecondary
        ..color = colorSecondary
        ..style = PaintingStyle.stroke;

    final c = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    // Ahora para trazar el circulo podemos usar el siguiente canvas
    canvas.drawCircle(c, radius, paint);

    // Arco
    final paintArco = Paint()
      ..strokeWidth = thicknessPrimary
      ..strokeCap   = StrokeCap.round
      ..color = colorPrimary
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