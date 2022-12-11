// ignore_for_file: prefer_initializing_formals

class Appearance {
  late String? gender;
  late String? race;
  late List<dynamic>? height;
  late List<dynamic>? weight;
  late String? eyeColor;
  late String? hairColor;

  Appearance(gender, race, height, weight, eyeColor, hairColor) {
    this.gender = gender;
    this.race = race;
    this.height = height;
    this.weight = weight;
    this.eyeColor = eyeColor;
    this.hairColor = hairColor;
  }
}
