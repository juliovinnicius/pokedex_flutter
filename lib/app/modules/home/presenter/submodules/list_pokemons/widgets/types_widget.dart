import 'package:flutter/material.dart';
import 'package:pokedex_flutter/app/core/extensions/capitalize_first_letter_extension.dart';
import 'package:pokedex_flutter/app/core/extensions/type_extension.dart';
import 'package:pokedex_flutter/app/core/themes/theme_colors.dart';
import 'package:pokedex_flutter/app/modules/home/domain/entity/pokemon_detail_home.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({super.key, required this.types});

  final Types types;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: types.type!.typeColors(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(types.type!.typeImage(), height: 20),
          const SizedBox(width: 2.5),
          Text(
            types.type!.name!.capitalizeFirstLetter(),
            style: textTheme.titleMedium!.copyWith(color: ThemeColors.white),
          ),
        ],
      ),
    );
  }
}
