import 'package:flutter/material.dart';

import '../../../../../../core/extensions/capitalize_first_letter_extension.dart';
import '../../../../../../core/extensions/gender_pokemon_extension.dart';
import '../../../../../../core/extensions/size_pokemon_extension.dart';
import '../../../../../../core/themes/theme_colors.dart';
import '../../../../domain/entity/pokemon_detail_home.dart';
import '../../../../domain/entity/pokemon_species.dart';
import 'information_species.dart';

class AboutPokemon extends StatelessWidget {
  const AboutPokemon({
    super.key,
    required this.species,
    required this.pokemon,
  });

  final PokemonSpecies species;
  final PokemonDetailHome pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            species.flavorTextEntries.first.flavorText.replaceAll('\n', ' '),
            style: textTheme.titleMedium!.copyWith(
              color: ThemeColors.darkGray,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InformationSpecies(
                title: 'Height',
                icon: 'img/height_icon.png',
                value: pokemon.height.heightPokemon(),
              ),
              InformationSpecies(
                title: 'Weight',
                icon: 'img/weight_icon.png',
                value: pokemon.weight.weightPokemon(),
              ),
              InformationSpecies(
                title: 'Gender',
                icon: 'img/gender_icon.png',
                value: species.genderRate.genderPokemon(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          InformationSpecies(
            title: 'Abilities',
            value: pokemon.abilities.first.ability.name.capitalizeFirstLetter(),
          ),
        ],
      ),
    );
  }
}
