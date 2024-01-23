class PokemonDetailHome {
  final int id;
  final String name;
  final List<Types> types;
  final String image;
  final int height;
  final int weight;
  final List<Stats> stats;
  final List<Abilities> abilities;

  PokemonDetailHome({
    required this.id,
    required this.name,
    required this.types,
    required this.image,
    required this.height,
    required this.weight,
    required this.stats,
    required this.abilities,
  });
}

class Abilities {
  final bool isHidden;
  final int slot;
  final Ability ability;

  Abilities({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });
}

class Ability {
  final String name;
  final String url;

  Ability({
    required this.name,
    required this.url,
  });
}

class Stats {
  final int baseStats;
  final int effort;
  final Stat stat;

  Stats({
    required this.baseStats,
    required this.effort,
    required this.stat,
  });
}

class Stat {
  final String name;
  final String url;

  Stat({
    required this.name,
    required this.url,
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
