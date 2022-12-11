import 'dart:convert';

import '../Helpers/exportsClass.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<List<HeroFinal>> heroesObtenidos(String argumento) async {
    List<HeroFinal> heroesTemporales = [];
    List<HeroFinal> heroesFinales = [];

    Uri uriAPIHero =
        Uri.parse("https://akabab.github.io/superhero-api/api/all.json");

    final responseHero = await http.get(uriAPIHero);
    if (responseHero.statusCode == 200) {
      String bodyResponse = utf8.decode(responseHero.bodyBytes);
      final bodyJson = jsonDecode(bodyResponse);

      for (var hero in bodyJson) {
        PowerStats powerstats = PowerStats(
            hero["powerstats"]["intelligence"],
            hero["powerstats"]["strength"],
            hero["powerstats"]["speed"],
            hero["powerstats"]["durability"],
            hero["powerstats"]["power"],
            hero["powerstats"]["combat"]);

        Appearance appearance = Appearance(
            hero["appearance"]["gender"],
            hero["appearance"]["race"],
            hero["appearance"]["height"],
            hero["appearance"]["weight"],
            hero["appearance"]["eyeColor"],
            hero["appearance"]["hairColor"]);

        Biography biography = Biography(
            hero["biography"]["fullName"],
            hero["biography"]["alterEgos"],
            hero["biography"]["aliases"],
            hero["biography"]["placeOfBirth"],
            hero["biography"]["firstAppearance"],
            hero["biography"]["publisher"],
            hero["biography"]["alignment"]);

        Work work = Work(hero["work"]["occupation"], hero["work"]["base"]);

        Images images = Images(hero["images"]["xs"], hero["images"]["sm"],
            hero["images"]["md"], hero["images"]["lg"]);

        heroesTemporales.add(HeroFinal(hero["id"], hero["name"], hero["slug"],
            powerstats, appearance, biography, work, images));
      }

      if (argumento != "") {
        // ignore: unnecessary_cast
        heroesFinales = heroesTemporales
            .where((heroe) => heroe.name!.contains(argumento))
            .toList() as List<HeroFinal>;
      } else {
        heroesFinales = heroesTemporales;
      }
    }

    return heroesFinales;
    ;
  }
}
