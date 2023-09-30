import 'package:hive_flutter/hive_flutter.dart';
import '../../models/pokemon_list_model.dart';
import 'local_datasource.dart';

class LocalDataSourceImp implements LocalDataSource {
  final Box box;

  LocalDataSourceImp({required this.box});

  @override
  PokemonItem? isPokemonInFavorites(String key) {
    PokemonItem? pokemonItem = box.get(key);
    return pokemonItem;
  }

  @override
  Future<PokemonItem?> addPokemonByName(PokemonItem pokemonItem) async {
    await box.put(pokemonItem.name, pokemonItem);
    return box.get(pokemonItem.name);
  }

  @override
  Future<PokemonItem?> removePokemonByName(String key) async {
    await box.delete(key);
    return box.get(key);
  }

  @override
  List<PokemonItem> getFavoritePokemonList() {
    List<PokemonItem> pokemonList = [];
    for (var key in box.keys) {
      final pokemonItem = box.get(key);
      if (pokemonItem is PokemonItem) {
        pokemonList.add(pokemonItem);
      }
    }
    return pokemonList;
  }

  @override
  Future<int> clearAllFavoritePokemon() async {
    return await box.clear();
  }
}
