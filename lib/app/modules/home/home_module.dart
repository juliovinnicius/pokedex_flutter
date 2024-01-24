import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_flutter/app/modules/home/domain/usecases/get_pokemon_details_home_usecase.dart';
import 'package:pokedex_flutter/app/modules/home/domain/usecases/get_species_pokemon_usecase.dart';
import 'package:pokedex_flutter/app/modules/home/presenter/cubit/species_cubit.dart';
import 'package:pokedex_flutter/app/modules/root_module.dart';

import '../../core/transitions/transitions.dart';
import 'domain/repositories/i_pokemons_repository.dart';
import 'domain/usecases/get_all_pokemon_usecase.dart';
import 'external/datasources/pokemons_datasource.dart';
import 'infrastructure/datasources/i_pokemons_datasource.dart';
import 'infrastructure/repositories/pokemon_repository.dart';
import 'presenter/cubit/home_cubit.dart';
import 'presenter/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [RootModule()];

  @override
  void binds(Injector i) {
    // Datasource
    i.addSingleton<IPokemonsDataSource>(PokemonsDataSource.new);

    //Repositories
    i.addSingleton<IPokemonsRepository>(PokemonRepository.new);

    //Usecase
    i.addSingleton<IGetAllPokemonsUseCase>(GetAllPokemonsUseCase.new);
    i.addSingleton<IGetPokemonDetailsUseCase>(GetPokemonDetailsUseCase.new);
    i.addSingleton<IGetSpeciesPokemonUseCase>(GetSpeciesPokemonUseCase.new);

    //Cubit
    i.addSingleton(HomeCubit.new);
    i.addSingleton(SpeciesCubit.new);
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
