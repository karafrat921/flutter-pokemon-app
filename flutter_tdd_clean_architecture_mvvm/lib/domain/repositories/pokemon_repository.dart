import '../entities/pokemon_detail_entity.dart';
import '../entities/pokemon_item_entity.dart';
import '../entities/pokemon_list_entity.dart';

abstract class PokemonRepository {
  Future<PokemonListEntity> getPokemon({
    required String? url,
  });

  PokemonItemEntity? isPokemonInFavorites({
    required String key,
  });

  Future<PokemonItemEntity?> addPokemonByName({required PokemonItemEntity pokemonItemEntity});

  Future<PokemonItemEntity?> removePokemonByName({required String key});

  Future<int> clearAllFavoritePokemon();

  Future<PokemonDetailEntity> getPokemonByName(String name);

  List<PokemonItemEntity> getFavoritePokemonList();
}
