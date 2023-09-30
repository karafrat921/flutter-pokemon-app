import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'core/api_helper/api_base_helper.dart';
import 'data/datasources/local_datasource/local_datasource.dart';
import 'data/datasources/local_datasource/local_datasource_imp.dart';
import 'data/datasources/remote_datasource/remote_datasource.dart';
import 'data/datasources/remote_datasource/remote_datasource_imp.dart';
import 'data/repositories/pokemon_repository_impl.dart';
import 'domain/repositories/pokemon_repository.dart';
import 'domain/usecases/add_pokemon_by_name.dart';
import 'domain/usecases/clear_all_favorite_pokemon.dart';
import 'domain/usecases/get_favori_pokemon_list.dart';
import 'domain/usecases/get_pokemon_by_name.dart';
import 'domain/usecases/get_pokemons.dart';
import 'domain/usecases/is_pokemon_in_favorites.dart';
import 'domain/usecases/remove_pokemon_by_name.dart';
import 'package:hive_flutter/hive_flutter.dart' as hive;

GetIt injector = GetIt.instance;

reset() {
  injector.reset();
}

void initializeDependencies() async {
  // hive
  injector.registerLazySingleton(() => hive.Hive.box("pokemon"));

  // http client
  injector.registerLazySingleton<http.Client>(() => http.Client());

  //Api helper
  injector.registerLazySingleton<ApiBaseHelper>(() => ApiBaseHelper(client: injector()));

  //Api
  injector.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(apiBaseHelper: injector()));

  //local
  injector.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp(box: injector()));

  //Repository
  injector.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      localDatasourceImp: injector(),
      remoteDataSourceImp: injector(),
    ),
  );

  //Usecases
  injector.registerLazySingleton<GetPokemon>(() => GetPokemon(injector()));
  injector.registerLazySingleton<IsPokemonInFavorites>(() => IsPokemonInFavorites(injector()));
  injector.registerLazySingleton<AddPokemonByName>(() => AddPokemonByName(injector()));
  injector.registerLazySingleton<RemovePokemonByName>(() => RemovePokemonByName(injector()));
  injector.registerLazySingleton<GetPokemonItemList>(() => GetPokemonItemList(injector()));
  injector.registerLazySingleton<ClearAllFavoritePokemon>(() => ClearAllFavoritePokemon(injector()));
  injector.registerLazySingleton<GetPokemonByName>(() => GetPokemonByName(injector()));
}
