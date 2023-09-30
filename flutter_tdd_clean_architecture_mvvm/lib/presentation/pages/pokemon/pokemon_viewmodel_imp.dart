import 'package:flutter/material.dart';
import '../../../core/api_helper/api_response.dart';
import '../../../domain/entities/pokemon_item_entity.dart';
import '../../../domain/entities/pokemon_list_entity.dart';
import '../../../domain/usecases/add_pokemon_by_name.dart';
import '../../../domain/usecases/clear_all_favorite_pokemon.dart';
import '../../../domain/usecases/get_favori_pokemon_list.dart';
import '../../../domain/usecases/get_pokemons.dart';
import '../../../domain/usecases/is_pokemon_in_favorites.dart';
import '../../../domain/usecases/remove_pokemon_by_name.dart';
import '../../../injection.dart';
import 'pokemon_viewmodel.dart';

class PokemonViewModelImp with ChangeNotifier implements PokemonViewModel {
  ApiResponse<PokemonListEntity> _pokemonListResponse = ApiResponse.loading('loading');

  @override
  ApiResponse<PokemonListEntity> get pokemonListResponse => _pokemonListResponse;

  @override
  set pokemonListResponse(ApiResponse<PokemonListEntity> value) {
    _pokemonListResponse = value;
    notifyListeners();
  }

  @override
  int pokemonListLength() {
    return pokemonListResponse.data.pokemons.length;
  }

  @override
  String getPokemonNameByIndex(int pokemonIndex) {
    return pokemonListResponse.data.pokemons[pokemonIndex].name;
  }

  String? _nextPage;

  bool _isDataFetching = false;

  @override
  bool get isDataFetching => _isDataFetching;

  @override
  set isDataFetching(bool value) {
    _isDataFetching = value;
    notifyListeners();
  }

  @override
  Future clearAllFavoritePokemon() async {
    int numberOfDeletedPokemon = await injector<ClearAllFavoritePokemon>().execute(
      const Params(),
    );
    if (numberOfDeletedPokemon > 0) {
      notifyListeners();
    }
  }

  @override
  List<PokemonItemEntity> getPokemonItemList() {
    List<PokemonItemEntity> pokemonItemEntity = injector<GetPokemonItemList>().execute(
      const ParamsGetFavoriPokemonList(),
    );
    return pokemonItemEntity;
  }

  @override
  Future<void> addPokemonByName(int index) async {
    PokemonItemEntity? pokemonItemEntity = await injector<AddPokemonByName>().execute(
      ParamsAddPokemon(pokemonListResponse.data.pokemons[index]),
    );
    if (pokemonItemEntity != null) {
      notifyListeners();
    }
  }

  @override
  Future<void> removePokemonByName(int index) async {
    PokemonItemEntity? pokemonItemEntity = await injector<RemovePokemonByName>().execute(
      ParamsKey(pokemonListResponse.data.pokemons[index].name),
    );
    if (pokemonItemEntity == null) {
      notifyListeners();
    }
  }

  @override
  bool isPokemonInFavorites(String key) {
    PokemonItemEntity? pokemonItemEntity = injector<IsPokemonInFavorites>().execute(
      ParamsForIsPokemonInFavorites(key),
    );

    return pokemonItemEntity != null ? true : false;
  }

  @override
  Future<void> getPokemon() async {
    isDataFetching = true;

    try {
      PokemonListEntity pokemonListEntity;

      if (_nextPage != null) {
        pokemonListEntity = await injector<GetPokemon>().execute(
          ParamsForPokemon(_nextPage),
        );

        pokemonListResponse.data.pokemons.addAll(pokemonListEntity.pokemons);
        _nextPage = pokemonListEntity.next;
      } else {
        pokemonListResponse = ApiResponse.loading("loading");
        pokemonListEntity = await injector<GetPokemon>().execute(
          ParamsForPokemon(_nextPage),
        );
        _nextPage = pokemonListEntity.next;
        pokemonListResponse = ApiResponse.completed(pokemonListEntity);
      }
    } catch (e) {
      pokemonListResponse = ApiResponse.error(e);
    }

    isDataFetching = false;
  }
}
