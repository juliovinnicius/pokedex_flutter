import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_flutter/app/modules/home/domain/usecases/get_pokemon_detail_favorite.dart';
import 'package:pokedex_flutter/app/modules/home/domain/usecases/remove_pokemon_favorite.dart';
import 'package:pokedex_flutter/app/modules/home/presenter/cubit/favorite_cubit.dart';

import '../../core/transitions/transitions.dart';
import '../root_module.dart';
import 'domain/repositories/i_pokemons_repository.dart';
import 'domain/usecases/store_favorite_pokemon_usecase.dart';
import 'domain/usecases/get_all_pokemon_usecase.dart';
import 'domain/usecases/get_pokemon_details_home_usecase.dart';
import 'domain/usecases/get_species_pokemon_usecase.dart';
import 'external/datasources/pokemon_local_datasource.dart';
import 'external/datasources/pokemons_datasource.dart';
import 'infrastructure/datasources/i_pokemon_local_datasource.dart';
import 'infrastructure/datasources/i_pokemons_datasource.dart';
import 'infrastructure/repositories/pokemon_repository.dart';
import 'presenter/cubit/home_cubit.dart';
import 'presenter/cubit/species_cubit.dart';
import 'presenter/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [RootModule()];

  @override
  void binds(Injector i) {
    // Datasource
    i.addSingleton<IPokemonsDataSource>(PokemonsDataSource.new);
    i.addSingleton<IPokemonLocalDataSource>(PokemonLocalDataSource.new);

    //Repositories
    i.addSingleton<IPokemonsRepository>(PokemonRepository.new);

    //Usecase
    i.addSingleton<IGetAllPokemonsUseCase>(GetAllPokemonsUseCase.new);
    i.addSingleton<IGetPokemonDetailsUseCase>(GetPokemonDetailsUseCase.new);
    i.addSingleton<IGetSpeciesPokemonUseCase>(GetSpeciesPokemonUseCase.new);
    i.addSingleton<IStoreFavoritePokemonUseCase>(
        StoreFavoritePokemonUseCase.new);
    i.addSingleton<IGetPokemonDetailsFavoriteUseCase>(
        GetPokemonDetailsFavoriteUseCase.new);
    i.addSingleton<IRemoveFavoritePokemonUseCase>(
        RemoveFavoritePokemonUseCase.new);

    //Cubit
    i.addSingleton(HomeCubit.new);
    i.addSingleton(SpeciesCubit.new);
    i.addSingleton(FavoriteCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
      transition: TransitionType.custom,
      customTransition: routeTransition,
    );
  }
}
