extension SizePokemonExtension on int {
  String heightPokemon() {
    var height = 0.0;
    height = this / 10;
    return '${height.toString().replaceAll('.', ',')} m';
  }

  String weightPokemon() {
    var weight = 0.0;
    weight = this / 10;
    return '${weight.toString().replaceAll('.', ',')} Kg';
  }
}
