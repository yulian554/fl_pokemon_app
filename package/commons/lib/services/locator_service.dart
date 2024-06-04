import 'package:fl_core_pokemon/domain/use_case/favorites_pokemons/favorites_pokemons_use_case.dart';
import 'package:fl_core_pokemon/data/data_source/favorites_pokemons/favorites_pokemons_data_source.dart';
import 'package:fl_core_pokemon/domain/use_case/favorites_pokemons/favorites_pokemons_use_case_impl.dart';
import 'package:fl_core_pokemon/domain/repositories/favorites_pokemons/favorites_pokemons_repository.dart';
import 'package:fl_core_pokemon/data/data_source/favorites_pokemons/favorites_pokemons_data_source_impl.dart';
import 'package:fl_core_pokemon/data/repositories/favorites_pokemons/favorites_pokemons_repository_impl.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

// Generic UseCases
void config() {
  final FavoritesPokemonsDataSource datasource =
      FavoritesPokemonsDataSourceImpl();
  final FavoritesPokemonsRepository repository =
      FavoritesPokemonsRepositoryImpl(datasource: datasource);
  final FavoritesPokemonsUseCase useCase =
      FavoritesPokemonsUseCaseImpl(repository: repository);
  locator.registerSingleton<FavoritesPokemonsUseCase>(useCase);
}
