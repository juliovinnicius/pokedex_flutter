extension PokemonIdExtension on int {
  String pokemonId() {
    var newId = '';
    if (this > 99) {
      newId = '#$this';
    } else if (this < 99 && this > 9) {
      newId = '#0$this';
    } else {
      newId = '#00$this';
    }
    return newId;
  }
}
