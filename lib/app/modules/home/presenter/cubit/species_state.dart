part of 'species_cubit.dart';

abstract class SpeciesState extends Equatable {}

final class SpeciesInitial extends SpeciesState {
  @override
  List<Object> get props => [];
}

class LoadingSpeciesState extends SpeciesState {
  @override
  List<Object> get props => [];
}

class LoadedPokemonSpeciesState extends SpeciesState {
  LoadedPokemonSpeciesState({required this.pokemonSpecies});

  final PokemonSpecies pokemonSpecies;

  @override
  List<Object> get props => [pokemonSpecies];
}

class ErrorSpeciesState extends SpeciesState {
  @override
  List<Object> get props => [];
}
