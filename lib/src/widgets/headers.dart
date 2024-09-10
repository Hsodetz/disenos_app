import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color:  Color(0xff615AAB),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.05,
      child: Container(
        height: 300,
        color: const Color(0xff615AAB),
      ),
    );
  }
}

class HeaderDiagonalCustomPainter extends StatelessWidget {
  const HeaderDiagonalCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ocupa todo el lienzo (canvas)
      height: double.infinity, // ocupa todo el lienzo (canvas)
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // creamos el lapiz con el que vamos a dibujar
    final lapiz = new Paint();

    // Asignamos las proiedades al lapiz
    lapiz.color = const Color(0xff615AAB);
    //lapiz.style = PaintingStyle.stroke; // Con este dibuja una linea
    lapiz.style = PaintingStyle.fill; // Con este rellena el cuadro
    lapiz.strokeWidth = 5.0;

    final path = new Path();

    // Dibujamos con el path y el lapiz
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //path.lineTo(0, size.height * 0.5); // esta no es necesaria, ya que el toma automaticamente el cierre para pintar

    // Dibuja
    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderTriangleCustomPainter extends StatelessWidget {
  const HeaderTriangleCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ocupa todo el lienzo (canvas)
      height: double.infinity, // ocupa todo el lienzo (canvas)
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTrianglePainter(),
      ),
    );
  }
}

class _HeaderTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // Creamos el lapiz o pintador
    final paint = new Paint();

    final paint2 = new Paint();

    // Propiedades del lapiz op pintador
    paint.color = Colors.red.shade200;
    paint.strokeWidth = 5.0;
    paint.style = PaintingStyle.fill;
    //paint.style = PaintingStyle.stroke;

    paint2.color = Colors.yellow.shade200;
    paint2.strokeWidth = 5.0;
    paint2.style = PaintingStyle.fill;

    // Dibujamos las lineas
    final path = new Path();
    final path2 = new Path();

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);

    // Dibujamos
    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint2);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderPicoCustomPainter extends StatelessWidget {
  const HeaderPicoCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ocupa todo el lienzo (canvas)
      height: double.infinity, // ocupa todo el lienzo (canvas)
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // Creamos el lapiz o pintador
    final paint = new Paint();

    // Propiedades del lapiz op pintador
    paint.color = Colors.red.shade200;
    paint.strokeWidth = 5.0;
    paint.style = PaintingStyle.fill;
    //paint.style = PaintingStyle.stroke;

    // Dibujamos las lineas
    final path = new Path();

    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);

    // Dibujamos
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderCurvoCustomPainter extends StatelessWidget {
  const HeaderCurvoCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ocupa todo el lienzo (canvas)
      height: double.infinity, // ocupa todo el lienzo (canvas)
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Creamos el lapiz o pintador
    final paint = new Paint();

    // Propiedades del lapiz op pintador
    paint.color = Colors.red.shade200;
    paint.strokeWidth = 5.0;
    paint.style = PaintingStyle.fill;
    //paint.style = PaintingStyle.stroke;

    // Dibujamos las lineas
    final path = new Path();

    path.lineTo(0, size.height * 0.2);

    // Haremos una curvatura, la misma se hace con quadraticBezierTo(), que recibe 4 parametros
    // x2, y2, son el punto final donde llegara la curva
    // x1, y1 son el punto por donde intercepta la curvatura
    // En el ejemplo podemos jugar moviendo los porcentajes de x1 y y1
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.4, size.width, size.height * 0.2);
    path.lineTo(size.width, 0);

    // Dibujamos
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class HeaderWaveCustomPainter extends StatelessWidget {
  const HeaderWaveCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ocupa todo el lienzo (canvas)
      height: double.infinity, // ocupa todo el lienzo (canvas)
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Creamos el lapiz o pintador
    final paint = new Paint();

    // Propiedades del lapiz op pintador
    paint.color = Colors.red.shade200;
    paint.strokeWidth = 5.0;
    paint.style = PaintingStyle.fill;
    //paint.style = PaintingStyle.stroke;

    // Dibujamos las lineas
    final path = new Path();

    path.lineTo(0, size.height * 0.2);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.3, size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.1, size.width, size.height * 0.2);

    path.lineTo(size.width, 0);

    // Dibujamos
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveBottomCustomPainter extends StatelessWidget {
  const HeaderWaveBottomCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ocupa todo el lienzo (canvas)
      height: double.infinity, // ocupa todo el lienzo (canvas)
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWaveBottomPainter(),
      ),
    );
  }
}

class _HeaderWaveBottomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Creamos el lapiz o pintador
    final paint = Paint();

    // Propiedades del lapiz op pintador
    paint.color = Colors.red.shade200;
    paint.strokeWidth = 15.0;
    paint.style = PaintingStyle.fill;
    //paint.style = PaintingStyle.stroke;

    // Dibujamos las lineas
    final path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.8);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7, size.width * 0.5, size.height * 0.8 );
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.89, size.width, size.height * 0.8);

    path.lineTo(size.width, size.height);

    // Dibujamos
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
