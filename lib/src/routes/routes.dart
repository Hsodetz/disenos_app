import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
import 'package:disenos_app/src/pages/headers_page.dart';
import 'package:disenos_app/src/pages/pinterest_page.dart';
import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:disenos_app/src/pages/sliver_list_page.dart';
import 'package:disenos_app/src/retos/cuadrado_animado_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <Route>[ 

  Route(icon: FontAwesomeIcons.slideshare, title: 'Slideshow', page: const SlidesShowPage()),
  Route(icon: FontAwesomeIcons.ambulance, title: 'Emergency', page: const EmergencyPage()),
  Route(icon: FontAwesomeIcons.heading, title: 'Encabezados', page: const HeadersPage()),
  Route(icon: FontAwesomeIcons.peopleCarry, title: 'Cuadro animado', page: const CuadradoAnimadoPage()),
  Route(icon: FontAwesomeIcons.circleNotch, title: 'Barra de Progreso', page: const GraficasCircularesPage()),
  Route(icon: FontAwesomeIcons.pinterest, title: 'Pinteres', page: const PinterestPage()),
  Route(icon: FontAwesomeIcons.mobile, title: 'Slivers', page: const SliverListPage()),


];


class Route {
  final IconData icon;
  final String title;
  final Widget page;

  Route({required this.icon, required this.title, required this.page});

  
}