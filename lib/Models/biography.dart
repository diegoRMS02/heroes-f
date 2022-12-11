// ignore_for_file: prefer_initializing_formals
class Biography {
  late String? fullName;
  late String? alterEgos;
  late List<dynamic>? aliases;

  late String? placeOfBirth;
  late String? firstAppearance;
  late String? publisher;
  late String? alignment;

  Biography(fullName, alterEgos, aliases, placeOfBirth, firstAppearance,
      publisher, alignment) {
    this.fullName = fullName;
    this.alterEgos = alterEgos;
    this.aliases = aliases;
    this.placeOfBirth = placeOfBirth;
    this.firstAppearance = firstAppearance;
    this.publisher = publisher;
    this.alignment = alignment;
  }
}
