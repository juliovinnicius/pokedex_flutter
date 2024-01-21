import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_detail_home.dart';

import '../../../../../../core/extensions/capitalize_first_letter_extension.dart';
import '../../../../../../core/extensions/pokemon_id_extension.dart';
import '../../../../../../core/extensions/type_extension.dart';
import '../../../../../../core/themes/theme_colors.dart';
import '../../../cubit/home_cubit.dart';

class ListPokemonsPage extends StatefulWidget {
  const ListPokemonsPage({super.key});

  @override
  State<ListPokemonsPage> createState() => _ListPokemonsPageState();
}

class _ListPokemonsPageState extends State<ListPokemonsPage> {
  final homeCubit = Modular.get<HomeCubit>();
  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    homeCubit.getPokemon();
    super.initState();
  }

  void setupScrollController(context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          homeCubit.getPokemon();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    setupScrollController(context);

    //TODO: ADICIONAR O LOADING AO CARREGAR MAIS ITENS DA LISTA

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
            bloc: homeCubit,
            builder: (context, state) {
              if (state is HomeInitial) {
                return const SizedBox();
              }

              if (state is LoadingState && state.isFirstFetch) {
                return Center(
                  child: CircularProgressIndicator(
                    color: colorScheme.onBackground,
                  ),
                );
              }

              List<PokemonDetailHome> listPokemons = [];
              bool isLoading = false;

              if (state is LoadingState) {
                listPokemons = state.oldPokemon;
                isLoading = true;
              } else if (state is LoadedPokemonDetailState) {
                listPokemons = state.listPokemon;
              }

              if (state is ErrorState) {
                return const Center(
                  child: Text('Nenhum pokemon encontrado'),
                );
              }

              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 46),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('img/gear.png'),
                              Image.asset('img/bell.png'),
                            ],
                          ),
                          Image.asset('img/pokemon_img.png'),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 38, top: 56),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        'Qual Pokémon você está procurando?',
                        style: textTheme.headlineLarge,
                      ),
                    ),
                  ),
                  SliverList.builder(
                    itemCount: listPokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = listPokemons[index];

                      return Card(
                        color: pokemon.types.first.type!.backgroundCardColors(),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
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
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            decoration: BoxDecoration(
                                              color: type.type!.typeColors(),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                    type.type!.typeImage()),
                                                const SizedBox(
                                                  width: 2.5,
                                                ),
                                                Text(
                                                  type.type!.name!
                                                      .capitalizeFirstLetter(),
                                                  style: textTheme.bodySmall!
                                                      .copyWith(
                                                          color: ThemeColors
                                                              .white),
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
                                      child: Image.asset('img/poke_img.png',
                                          opacity: const AlwaysStoppedAnimation(
                                              0.2)),
                                    ),
                                    Positioned(
                                      bottom: -10,
                                      child: Image.network(
                                        pokemon.image,
                                        height: 115,
                                        width: 115,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              );
            }),
      ),
    );
  }
}