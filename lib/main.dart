import 'Helpers/exportsClass.dart';

//Ejecutor, dispoarador
void main() {
  runApp(const HeroMain());
}

//Widget Principal
class HeroMain extends StatelessWidget {
  const HeroMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HeroRoutes.home_screen,
      routes: HeroRoutes.routes_hero,
    );
  }
}
