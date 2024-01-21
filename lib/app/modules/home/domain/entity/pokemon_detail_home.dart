class PokemonDetailHome {
  final int id;
  final String name;
  final List<Types> types;
  final String image;

  PokemonDetailHome({
    required this.id,
    required this.name,
    required this.types,
    required this.image,
  });
}

class Types {
  int? slot;
  Type? type;

  Types({this.slot, this.type});
}

class Type {
  String? name;
  String? url;

  Type({this.name, this.url});
}
