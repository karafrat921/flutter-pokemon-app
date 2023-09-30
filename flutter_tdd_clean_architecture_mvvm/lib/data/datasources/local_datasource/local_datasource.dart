import '../../../domain/entities/pokemon_item_entity.dart';
import '../../models/pokemon_list_model.dart';

abstract class LocalDataSource {


  PokemonItem? isPokemonInFavorites(String key);

  Future<PokemonItem?> addPokemonByName(PokemonItem pokemonItem);

  Future<PokemonItem?> removePokemonByName(String key);

  List<PokemonItem> getFavoritePokemonList();

  Future<int>  clearAllFavoritePokemon();
}
