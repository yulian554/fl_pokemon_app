import 'package:fl_core_pokemon/data/data_source/storage/impl/storage_data_source_impl.dart';
import 'package:fl_core_pokemon/data/data_source/storage/storage_data_source.dart';
import 'package:fl_core_pokemon/data/repositories/storage/storage_repository_impl.dart';
import 'package:fl_core_pokemon/domain/repositories/storage/storage_repository.dart';
import 'package:fl_core_pokemon/domain/use_case/favorites_pokemons/impl/favorites_pokemons_use_case_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:fl_core_pokemon/domain/use_case/favorites_pokemons/favorites_pokemons_use_case.dart';

GetIt locator = GetIt.instance;

// Generic UseCases
void initRegisterDependencies() {
  _registerDataSources();
  _registerRepositories();
  _registerUseCases();
}

void _registerDataSources() {
  locator.registerFactory<StorageDataSource>(
    () => StorageDataSourceImpl(),
  );
}

void _registerRepositories() {
  locator.registerFactory<StorageRepository>(
    () => StorageRepositoryImpl(datasource: locator.get()),
  );
}

void _registerUseCases() {
  locator.registerFactory<FavoritesPokemonsUseCase>(
    () => FavoritesPokemonsUseCaseImpl(repository: locator.get()),
  );
}
