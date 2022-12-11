// ignore_for_file: constant_identifier_names, prefer_const_constructors, non_constant_identifier_names

import '../Helpers/exportsClass.dart';

class HeroRoutes {
  static const home_screen = "Pantalla_Inicio";

  static Map<String, Widget Function(BuildContext)> routes_hero = {
    "Pantalla_Inicio": (context) => ScreenHero(),
    "Pantalla_Detalle": (context) => ScreenDetailHero()
  };
}
