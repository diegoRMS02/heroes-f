// ignore_for_file: non_constant_identifier_names

import 'package:super_hero/Helpers/exportsClass.dart';

class ScreenDetailHero extends StatelessWidget {
  const ScreenDetailHero({super.key});

  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;

    final hereoRecibido =
        ModalRoute.of(context)?.settings.arguments as HeroFinal;
    final powerHero = hereoRecibido.powerstats!;
    final imgHeroe = hereoRecibido.images!.imgLG;
    return Scaffold(
      body: SizedBox(
        height: alto,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ParteHeader(ancho, alto, hereoRecibido, context),
            parteMedia(ancho, alto, hereoRecibido, context),
          ],
        ),
      ),
    );
  }
}

Widget ParteHeader(
    double ancho, double alto, HeroFinal Heroe, BuildContext context) {
  var altoX = alto * 0.6;
  final imgHeroe = Heroe.images!.imgLG;
  var anchoPowers = 35;
  PowerStats? ps = Heroe.powerstats;
  return Container(
    height: altoX,
    width: ancho,
    padding: EdgeInsets.symmetric(horizontal: ancho * 0.001),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
      image: DecorationImage(
          image: FadeInImage(
            image: NetworkImage(imgHeroe!),
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            placeholder: const AssetImage("images/SpinnerImg.gif"),
          ).image,
          fit: BoxFit.cover),
    ),
    child: Column(children: [
      const Spacer(
        flex: 3,
      ),
      Container(
        height: altoX * 0.5,
        padding: EdgeInsets.symmetric(vertical: ancho * 0.1),
        margin: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.4),
        ),
        child: Container(
            width: 300,
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  Heroe.name.toString(),
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                Text(
                  Heroe.slug.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text("Gender ${Heroe.appearance?.gender}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.intelligence}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.strength}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.speed}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.durability}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.power}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.combat}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  )
                ])
              ],
            )),
      )
    ]),
  );
}

Widget parteMedia(
    double ancho, double alto, HeroFinal Heroe, BuildContext context) {
  return Positioned(
    bottom: 10,
    left: 10,
    child: Container(
      height: 280,
      width: ancho - 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10)]),
      child: SafeArea(
          child: Column(
        children: [
          DefaultTabController(
              initialIndex: 0,
              length: 4,
              child: SafeArea(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [swiper(Heroe)],
              ))),
        ],
      )),
    ),
  );
}

Widget swiper(HeroFinal Heroe) {
  final powerHero = Heroe.powerstats!;
  final hero = [
    Heroe.appearance,
    Heroe.biography,
    Heroe.powerstats,
    Heroe.work
  ];
  return Container(
    padding: const EdgeInsets.all(5),
    width: 300,
    height: 150.0,
    margin: const EdgeInsets.only(left: 60, right: 60),
    child: Swiper(
      viewportFraction: 0.8,
      scale: 0.9,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${hero[index]}"),
              Text("Intelligence = ${powerHero.intelligence}"),
              Text("Strength = ${powerHero.strength}"),
              Text("Speed = ${powerHero.speed}"),
              Text("Durability = ${powerHero.durability}"),
              Text("Power = ${powerHero.power}"),
              Text("Combat = ${powerHero.combat}"),
            ],
          ),
        );
      },
      itemCount: 4,
      pagination: const SwiperPagination(),
      control: const SwiperControl(),
    ),
  );
}
