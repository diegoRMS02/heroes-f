import 'package:super_hero/Helpers/exportsClass.dart';

import '../Service/service.dart';

class HerosearchDelegate extends SearchDelegate {
  late Future<List<HeroFinal>> heroesObtenidos;
  HerosearchDelegate();
  List<HeroFinal> heroes = [];
  List<HeroFinal> filter = [];
  @override
  String get searchFieldLabel => "Encuentra a tu heroe favorito";
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final Service = new Services();
    if (query.trim().isEmpty) {
      return const Text("no hay valor");
    }
    return FutureBuilder(
        future: Services.heroesObtenidos(query),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            //crear la lista
            return _Buscar(snapshot.data);
          } else {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 4,
            ));
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Service = new Services();
    if (query.trim().isEmpty) {
      return const Text("no hay valor");
    }
    return FutureBuilder(
        future: Services.heroesObtenidos(query),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            //crear la lista
            return _Buscar(snapshot.data);
          } else {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 4,
            ));
          }
        });
  }
}

Widget _Buscar(List<HeroFinal> hero) {
  return ListView.builder(
      itemCount: hero.length,
      itemBuilder: (context, index) {
        final heroes = hero[index];
        return ListTile(
          leading: FadeInImage(
            image: NetworkImage(heroes.images!.imgXS!),
            placeholder: const AssetImage("images/SpinnerImg.gif"),
          ),
          title: Text(heroes.name!),
          subtitle: Text(heroes.appearance!.gender!),
          onTap: () {
            Navigator.pushNamed(context, "Pantalla_Detalle", arguments: heroes);
          },
        );
      });
}
