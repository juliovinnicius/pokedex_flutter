import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_flutter/app/modules/home/presenter/cubit/favorite_cubit.dart';
import 'package:pokedex_flutter/app/modules/home/presenter/cubit/species_cubit.dart';

import '../../../../core/themes/themes.dart';
import '../cubit/home_cubit.dart';
import '../submodules/favorites/pages/favorite_page.dart';
import '../submodules/list_pokemons/pages/list_pokemons_page.dart';
import '../submodules/profile/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeCubit = Modular.get<HomeCubit>();
  final speciesCubit = Modular.get<SpeciesCubit>();
  final favoriteCubit = Modular.get<FavoriteCubit>();

  late final PageController pageController;

  int selectIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // create: (_) => homeCubit,
      providers: [
        BlocProvider<HomeCubit>(create: (_) => homeCubit),
        BlocProvider<SpeciesCubit>(create: (_) => speciesCubit),
        BlocProvider<FavoriteCubit>(create: (_) => favoriteCubit),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 46,
                ),
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
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: const [
                    ListPokemonsPage(),
                    FavoritePage(),
                    ProfilePage(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'img/home_img.png',
                color: selectIndex == 0
                    ? colorScheme.primary
                    : colorScheme.secondary,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'img/fav_img.png',
                color: selectIndex == 1
                    ? colorScheme.primary
                    : colorScheme.secondary,
              ),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'img/profile_img.png',
                color: selectIndex == 2
                    ? colorScheme.primary
                    : colorScheme.secondary,
              ),
              label: 'Perfil',
            ),
          ],
          currentIndex: selectIndex,
          onTap: (i) {
            setState(() {
              selectIndex = i;
            });
            pageController.animateToPage(
              selectIndex,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear,
            );
          },
        ),
      ),
    );
  }
}
