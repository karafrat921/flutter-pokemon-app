import '../../domain/entities/pokemon_detail_entity.dart';
import '../../domain/entities/pokemon_item_entity.dart';
import '../../domain/entities/pokemon_list_entity.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/local_datasource/local_datasource.dart';
import '../datasources/remote_datasource/remote_datasource.dart';
import '../models/pokemon_detail_model.dart';
import '../models/pokemon_list_model.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final LocalDataSource localDatasourceImp;
  final RemoteDataSource remoteDataSourceImp;

  const PokemonRepositoryImpl({
    required this.remoteDataSourceImp,
    required this.localDatasourceImp,
  });

  @override
  Future<PokemonListEntity> getPokemon({
    required String? url,
  }) async {
    PokemonListModel pokemonListModel = await remoteDataSourceImp.getPokemon(url);
    return pokemonListModel.convertToEntity();
  }

  @override
  Future<PokemonDetailEntity> getPokemonByName(String name) async {
    PokemonDetailModel pokemonModel = await remoteDataSourceImp.getPokemonByName(name);
    return pokemonModel.convertToEntity();
  }

  @override
  PokemonItemEntity? isPokemonInFavorites({
    required String key,
  }) {
    PokemonItem? pokemonItem = localDatasourceImp.isPokemonInFavorites(key);
    PokemonItemEntity? pokemonItemEntity;
    if (pokemonItem != null) {
      pokemonItemEntity = PokemonItemEntity(name: pokemonItem.name, url: pokemonItem.url);
    }
    return pokemonItemEntity;
  }

  @override
  Future<PokemonItemEntity?> addPokemonByName({required PokemonItemEntity pokemonItemEntity}) async {
    PokemonItem? pokemonItem= await localDatasourceImp.addPokemonByName(PokemonItem(name: pokemonItemEntity.name, url: pokemonItemEntity.url));
    return pokemonItem?.convertToEntity();
  }

  @override
  Future<PokemonItemEntity?> removePokemonByName({required String key}) async {
   PokemonItem? pokemonItem=  await localDatasourceImp.removePokemonByName(key);
   return pokemonItem?.convertToEntity();
  }

  @override
 Future<int> clearAllFavoritePokemon() async {
    return await localDatasourceImp.clearAllFavoritePokemon();
  }

  @override
  List<PokemonItemEntity> getFavoritePokemonList() {
    final pokemons = localDatasourceImp.getFavoritePokemonList();
    return pokemons.map((pokemon) => PokemonItemEntity(name: pokemon.name, url: pokemon.url)).toList();
  }
}
