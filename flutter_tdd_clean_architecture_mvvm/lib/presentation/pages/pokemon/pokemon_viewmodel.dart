import 'package:flutter/material.dart';
import '../../../core/api_helper/api_response.dart';
import '../../../domain/entities/pokemon_item_entity.dart';
import '../../../domain/entities/pokemon_list_entity.dart';

abstract class PokemonViewModel with ChangeNotifier {
  ApiResponse<PokemonListEntity> get pokemonListResponse;

  set pokemonListResponse(ApiResponse<PokemonListEntity> value);

  Future<void> getPokemon();

  bool isPokemonInFavorites(String key);

  Future<void> removePokemonByName(int index);

  Future<void> addPokemonByName(int index);

  int pokemonListLength();

  String getPokemonNameByIndex(int pokemonIndex);

  bool get isDataFetching;

  set isDataFetching(bool value);

  Future clearAllFavoritePokemon();

  List<PokemonItemEntity> getPokemonItemList();
}
