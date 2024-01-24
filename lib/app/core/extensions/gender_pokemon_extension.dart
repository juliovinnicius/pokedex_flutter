extension GenderPokemonExtension on int {
  String genderPokemon() {
    if (this != -1) {
      return 'Female/Male';
    } else {
      return 'Genderless';
    }
  }
}
