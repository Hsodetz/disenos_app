import 'package:disenos_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: //HeaderCuadrado(),
      //HeaderBordesRedondeados(),
      //HeaderDiagonal(),
      //HeaderDiagonalCustomPainter(),
      //HeaderTriangleCustomPainter(),
        //HeaderPicoCustomPainter(),
        //HeaderCurvoCustomPainter(),
      //HeaderWaveCustomPainter(),
        HeaderWaveBottomCustomPainter(),

    );
  }
}

