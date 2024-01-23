import 'package:flutter/material.dart';
import 'package:pokedex_flutter/app/modules/home/presenter/submodules/list_pokemons/widgets/types_widget.dart';

import '../../../../../../core/extensions/capitalize_first_letter_extension.dart';
import '../../../../../../core/extensions/pokemon_id_extension.dart';
import '../../../../../../core/themes/theme_colors.dart';
import '../../../../domain/entity/pokemon_detail_home.dart';

class PokemonDetailsBottomSheet extends StatelessWidget {
  const PokemonDetailsBottomSheet({super.key, required this.pokemon});

  final PokemonDetailHome pokemon;
  // TabController _controller = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

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
                decoration: const BoxDecoration(
                  gradient: ThemeColors.fireGradient,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Row(
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
                    Column(
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
                    )
                  ],
                ),
              ),
              Container(
                height: size.height * 0.5,
                color: ThemeColors.white,
                child: DefaultTabController(
                  length: 4,
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
                          Tab(
                            text: 'Evolution',
                          ),
                          Tab(
                            text: 'Moves',
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          color: ThemeColors.almostWhite,
                          child: const TabBarView(
                            children: <Widget>[
                              Column(
                                children: [],
                              ),
                              Center(
                                child: Text("It's rainy here"),
                              ),
                              Center(
                                child: Text("It's sunny here"),
                              ),
                              Center(
                                child: Text("It's teste here"),
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
  }
}

/*
  Column(
      children: [
        Container(
          height: size.height * 0.18,
          decoration: const BoxDecoration(
            gradient: ThemeColors.fireGradient,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          // child:
        ),
        Container(
          height: size.height * 0.5,
          color: ThemeColors.white,
          // child:
        ),
      ],
    );
 */

/* */

/*


          
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
                        type.type!.name!.capitalizeFirstLetter(),
                        style: textTheme.bodySmall!
                            .copyWith(color: ThemeColors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
           */
