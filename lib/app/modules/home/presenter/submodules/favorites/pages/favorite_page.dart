import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_flutter/app/core/extensions/capitalize_first_letter_extension.dart';
import 'package:pokedex_flutter/app/core/extensions/pokemon_id_extension.dart';
import 'package:pokedex_flutter/app/core/extensions/type_extension.dart';
import 'package:pokedex_flutter/app/modules/home/presenter/cubit/favorite_cubit.dart';

import '../../../../../../core/themes/theme_colors.dart';
import '../../../../../../core/widgets/bottom_sheet_manager.dart';
import '../../list_pokemons/widgets/pokemon_details_bottomsheet.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final favoriteCubit = Modular.get<FavoriteCubit>();

  @override
  void initState() {
    favoriteCubit.getFavoritePokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is LoadingFavoriteState || state is FavoriteInitial) {
          return Center(
            child: CircularProgressIndicator(
              color: colorScheme.onBackground,
            ),
          );
        }

        if (state is ErrorFavoriteState) {
          return const Center(
            child: Text('Nenhum pokemon encontrado'),
          );
        }
        final pokemons = (state as LoadedFavoriteState).listPokemonDetail;
        return ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];

            return GestureDetector(
              onTap: () async {
                BottomSheetManager.showBottomSheetModal(
                  context: context,
                  content: PokemonDetailsBottomSheet(pokemon: pokemon),
                );
              },
              child: Card(
                color: pokemon.types.first.type!.backgroundCardColors(),
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 24,
                          top: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pokemon.id.pokemonId(),
                              style: textTheme.bodySmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              pokemon.name.capitalizeFirstLetter(),
                              style: textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                ...pokemon.types.map(
                                  (type) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      color: type.type!.typeColors(),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(type.type!.typeImage()),
                                        const SizedBox(
                                          width: 2.5,
                                        ),
                                        Text(
                                          type.type!.name!
                                              .capitalizeFirstLetter(),
                                          style: textTheme.bodySmall!.copyWith(
                                            color: ThemeColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 135,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Image.asset(
                                'img/poke_img.png',
                                opacity: const AlwaysStoppedAnimation(
                                  0.2,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              child: Image.network(
                                pokemon.image,
                                height: 115,
                                width: 115,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 16,
                              child: GestureDetector(
                                onTap: () async {
                                  await favoriteCubit
                                      .removePokemonFavorite(pokemon);
                                  await favoriteCubit.getFavoritePokemon();
                                },
                                child: Image.asset(
                                  'img/favorite_img.png',
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
