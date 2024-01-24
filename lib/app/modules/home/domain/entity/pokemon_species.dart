class PokemonSpecies {
  final int id;
  final List<FlavorTextEntries> flavorTextEntries;
  final int genderRate;

  PokemonSpecies({
    required this.id,
    required this.flavorTextEntries,
    required this.genderRate,
  });
}

class FlavorTextEntries {
  String flavorText;

  FlavorTextEntries({required this.flavorText});
}
