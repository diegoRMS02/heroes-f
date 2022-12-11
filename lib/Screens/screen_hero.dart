import 'package:super_hero/Helpers/HeroSearchDelegate.dart';

import '../Helpers/exportsClass.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
// ignore: unused_import

class ScreenHero extends StatefulWidget {
  const ScreenHero({super.key});

  @override
  State<ScreenHero> createState() => _ScreenHeroState();
}

class _ScreenHeroState extends State<ScreenHero> {
  late Future<List<HeroFinal>> heroesObtenidos;
  late String argumento = "X";
  @override
  void initState() {
    super.initState();
    heroesObtenidos = Services.heroesObtenidos(argumento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Pantalla del Heroe"),
          leading: IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: HerosearchDelegate()),
            icon: Icon(Icons.search),
          )),
      body: FutureBuilder(
        future: heroesObtenidos,
        builder: (context, heroes) {
          if (heroes.hasData) {
            return ListView(
              children: listaHeroes(heroes.data!),
            );
          } else if (heroes.hasError) {
            return const Text("No se encontraron heroes");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  List<Widget> listaHeroes(List<HeroFinal> heroesData) {
    List<Widget> heroes = [];

    for (var heroe in heroesData) {
      var nombreHeroe = heroe.name.toString();
      var imgHereo = heroe.images!.imgLG;
      heroes.add(Center(
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: FadeInImage(
                  image: NetworkImage(imgHereo!),
                  placeholder: const AssetImage("images/SpinnerImg.gif"),
                ),
                title: Text(nombreHeroe),
              ), //CircleAvatar

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(width: 8),
                  Text(nombreHeroe),
                  const SizedBox(width: 8)
                ],
              ),
              Row(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text("Ver"),
                    onPressed: () {
                      //Muestre un modal pop up
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: ((context) {
                            return mostrarDialogo(heroe, context);
                            /* AlertDialog(
                              title: Text(nombreHeroe),
                              content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(heroe.biography!.fullName!),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(heroe.work!.occupation!)
                                  ]),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      print("se debe cerrar cuando demosclick");
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cerrar"))
                              ],
                            ); */
                          }));
                      print("puede hacer algo o no");
                    },
                  ),
                  TextButton(
                    child: const Text('más info'),
                    onPressed: () {
                      Navigator.pushNamed(context, "Pantalla_Detalle",
                          arguments: heroe);
                    },
                  ),
                  const SizedBox(width: 8)
                ],
              ),
            ],
          ),
        ),
      ));
    }

    return heroes;
  }
}

mostrarDialogo(HeroFinal heroe, BuildContext context) {
  return AlertDialog(
    title: Text(heroe.name!),
    content: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(heroe.biography!.fullName!),
      const SizedBox(
        height: 10,
      ),
      Text(heroe.work!.occupation!)
    ]),
    actions: [
      TextButton(
          onPressed: () {
            print("se debe cerrar cuando demosclick");
            Navigator.pop(context);
          },
          child: const Text("Cerrar"))
    ],
  );
}
