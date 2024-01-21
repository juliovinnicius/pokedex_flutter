import 'package:flutter/material.dart';

import '../../modules/home/domain/entity/pokemon_detail_home.dart';
import '../themes/themes.dart';

extension TypeExtension on Type {
  Color typeColors() {
    var color = ThemeColors.irishGreen;
    if (name == 'grass') {
      color = ThemeColors.irishGreen;
    } else if (name == 'fire') {
      color = ThemeColors.neonRed;
    } else if (name == 'water') {
      color = ThemeColors.brightBlue;
    } else if (name == 'ground') {
      color = ThemeColors.purpleBrown;
    } else if (name == 'rock') {
      color = ThemeColors.darkGray2;
    } else if (name == 'bug') {
      color = ThemeColors.softGreen;
    } else if (name == 'ice') {
      color = ThemeColors.lightBlue;
    } else if (name == 'normal') {
      color = ThemeColors.chestNut;
    } else if (name == 'poison') {
      color = ThemeColors.amethyst;
    } else if (name == 'flying') {
      color = ThemeColors.cloudBlue;
    } else if (name == 'electric') {
      color = ThemeColors.yellowishOrange;
    } else if (name == 'fairy') {
      color = ThemeColors.candyPink;
    } else if (name == 'fighting') {
      color = ThemeColors.tintedBlack;
    } else if (name == 'psychic') {
      color = ThemeColors.bluePurple;
    } else if (name == 'steel') {
      color = ThemeColors.gunMetal;
    } else if (name == 'ghost') {
      color = ThemeColors.tintedGray;
    } else if (name == 'dragon') {
      color = ThemeColors.ultramarine;
    } else if (name == 'dark') {
      color = ThemeColors.darkNavy;
    } else {
      color = ThemeColors.white;
    }

    return color;
  }

  Color backgroundCardColors() {
    var color = ThemeColors.softGreen;
    if (name == 'grass') {
      color = ThemeColors.softGreen;
    } else if (name == 'fire') {
      color = ThemeColors.fadedOrange;
    } else if (name == 'water') {
      color = ThemeColors.brightSkyBlue;
    } else if (name == 'ground') {
      color = ThemeColors.brownish;
    } else if (name == 'rock') {
      color = ThemeColors.brownishGray;
    } else if (name == 'bug') {
      color = ThemeColors.lightKhaki;
    } else if (name == 'ice') {
      color = ThemeColors.powderBlue;
    } else if (name == 'normal') {
      color = ThemeColors.lightPeach;
    } else if (name == 'poison') {
      color = ThemeColors.lavender;
    } else if (name == 'flying') {
      color = ThemeColors.powderBlue;
    } else if (name == 'electric') {
      color = ThemeColors.eletricYellow;
    } else if (name == 'fairy') {
      color = ThemeColors.powderPink;
    } else if (name == 'fighting') {
      color = ThemeColors.silver;
    } else if (name == 'psychic') {
      color = ThemeColors.lavanderBlue;
    } else if (name == 'steel') {
      color = ThemeColors.gunMetal;
    } else if (name == 'ghost') {
      color = ThemeColors.darkWhite;
    } else if (name == 'dragon') {
      color = ThemeColors.powderBlue;
    } else if (name == 'dark') {
      color = ThemeColors.palePurple;
    } else {
      color = ThemeColors.white;
    }

    return color;
  }

  String typeImage() {
    var image = '';
    if (name == 'grass') {
      image = 'img/grass_type.png';
    } else if (name == 'fire') {
      image = 'img/fire.png';
    } else if (name == 'water') {
      image = 'img/water_type.png';
    } else if (name == 'ground') {
      image = 'img/ground.png';
    } else if (name == 'rock') {
      image = 'img/rock_type.png';
    } else if (name == 'ice') {
      image = 'img/ice.png';
    } else if (name == 'bug') {
      image = 'img/bug_type_img.png';
    } else if (name == 'normal') {
      image = 'img/normal_type.png';
    } else if (name == 'poison') {
      image = 'img/poison_type.png';
    } else if (name == 'flying') {
      image = 'img/flying.png';
    } else if (name == 'electric') {
      image = 'img/eletric_type.png';
    } else if (name == 'fairy') {
      image = 'img/fairy_type.png';
    } else if (name == 'fighting') {
      image = 'img/fighting_type.png';
    } else if (name == 'psychic') {
      image = 'img/psychic.png';
    } else if (name == 'steel') {
      image = 'img/steel.png';
    } else if (name == 'ghost') {
      image = 'img/ghost.png';
    } else if (name == 'dragon') {
      image = 'img/dragon.png';
    } else if (name == 'dark') {
      image = 'img/dark_type_img.png';
    } else {
      image = 'img/normal_type.png';
    }

    return image;
  }
}
