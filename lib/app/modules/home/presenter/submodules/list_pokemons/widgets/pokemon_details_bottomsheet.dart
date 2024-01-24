import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_flutter/app/core/extensions/type_extension.dart';
import 'package:pokedex_flutter/app/modules/home/presenter/cubit/favorite_cubit.dart';

import '../../../../../../core/extensions/capitalize_first_letter_extension.dart';
import '../../../../../../core/extensions/pokemon_id_extension.dart';
import '../../../../../../core/themes/theme_colors.dart';
import '../../../../domain/entity/pokemon_detail_home.dart';
import '../../../cubit/species_cubit.dart';
import 'about_pokemon.dart';
import 'types_widget.dart';

class PokemonDetailsBottomSheet extends StatelessWidget {
  PokemonDetailsBottomSheet({
    super.key,
    required this.pokemon,
  });

  final PokemonDetailHome pokemon;
  final speciesCubit = Modular.get<SpeciesCubit>();
  final favoriteCubit = Modular.get<FavoriteCubit>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    speciesCubit.getSpecies(pokemon);

    return BlocBuilder<SpeciesCubit, SpeciesState>(
        bloc: speciesCubit,
        builder: (context, state) {
          if (state is SpeciesInitial || state is LoadingSpeciesState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final species = (state as LoadedPokemonSpeciesState).pokemonSpecies;
          return Wrap(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.18,
                      decoration: BoxDecoration(
                        gradient:
                            pokemon.types.first.type!.typeBackgroundDetails(),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Stack(
                        children: [
                          BlocBuilder<FavoriteCubit, FavoriteState>(
                            bloc: favoriteCubit,
                            builder: (context, state) {
                              if (state is FavoriteInitial ||
                                  state is LoadingFavoriteState ||
                                  state is ErrorFavoriteState) {
                                return Positioned(
                                  top: 10,
                                  right: 16,
                                  child: GestureDetector(
                                    onTap: () {
                                      favoriteCubit.storeFavorite(pokemon);
                                    },
                                    child: Image.asset(
                                      'img/unfavorite_img.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                );
                              }
                              final listPokemon = (state as LoadedFavoriteState)
                                  .listPokemonDetail;

                              var pokeIds = listPokemon.map((poke) => poke.id);
                              bool isFavorite = pokeIds.contains(pokemon.id);

                              return Positioned(
                                top: 10,
                                right: 16,
                                child: GestureDetector(
                                  onTap: () {
                                    if (pokeIds.contains(pokemon.id)) {
                                      favoriteCubit
                                          .removePokemonFavorite(pokemon);
                                    } else {
                                      favoriteCubit.storeFavorite(pokemon);
                                    }
                                  },
                                  child: Image.asset(
                                    isFavorite
                                        ? 'img/favorite_img.png'
                                        : 'img/unfavorite_img.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              );
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left: 5,
                                      bottom: -15,
                                      child: Image.network(
                                        pokemon.image,
                                        height: 220,
                                        // width: 236,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      pokemon.id.pokemonId(),
                                      style: textTheme.labelSmall!.copyWith(
                                        color: ThemeColors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      pokemon.name.capitalizeFirstLetter(),
                                      style: textTheme.displayLarge!.copyWith(
                                        color: ThemeColors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        ...pokemon.types.map(
                                          (type) => TypeWidget(types: type),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.5,
                      color: ThemeColors.white,
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            const TabBar(
                              tabs: <Widget>[
                                Tab(
                                  text: 'About',
                                ),
                                Tab(
                                  text: 'Stats',
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                color: ThemeColors.almostWhite,
                                child: TabBarView(
                                  children: <Widget>[
                                    AboutPokemon(
                                      species: species,
                                      pokemon: pokemon,
                                    ),
                                    Column(
                                      children: [
                                        ListView.builder(
                                          padding: const EdgeInsets.only(
                                            top: 32,
                                            left: 32,
                                            right: 32,
                                          ),
                                          shrinkWrap: true,
                                          itemCount: pokemon.stats.length,
                                          itemBuilder: (context, index) {
                                            final stat = pokemon.stats[index];
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 28),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    stat.stat.name
                                                        .capitalizeFirstLetter(),
                                                    style: textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Text(
                                                    stat.baseStats.toString(),
                                                    style:
                                                        textTheme.titleMedium,
                                                  ),
                                                  const SizedBox(width: 12),
                                                  SizedBox(
                                                    width: 190 *
                                                        stat.baseStats
                                                            .toDouble() /
                                                        100,
                                                    child:
                                                        LinearProgressIndicator(
                                                      value: stat.baseStats
                                                          .toDouble(),
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      color: stat.baseStats <=
                                                              60
                                                          ? ThemeColors.neonRed
                                                          : ThemeColors
                                                              .ultramarine,
                                                      minHeight: 12,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        Text(
                                          'Total ${pokemon.stats.map((stat) => stat.baseStats).reduce((a, b) => a + b)}',
                                          style:
                                              textTheme.titleMedium!.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
