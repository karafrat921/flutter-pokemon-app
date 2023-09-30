import 'package:flutter/material.dart';
import '../../../core/api_helper/api_response.dart';
import '../../../core/utils/utils.dart';
import '../../../domain/entities/basestat_entity.dart';
import '../../../domain/entities/pokemon_detail_entity.dart';
import '../../../domain/usecases/get_pokemon_by_name.dart';
import '../../../injection.dart';
import 'pokemon_attributes.dart';
import 'pokemon_detail_viewmodel.dart';
import 'pokemon_size.dart';

class PokemonDetailViewModelImp with ChangeNotifier implements PokemonDetailViewModel {
  ApiResponse<PokemonDetailEntity> _getPokemonByNameResponse = ApiResponse.loading('loading');

  @override
  ApiResponse<PokemonDetailEntity> get getPokemonByNameResponse => _getPokemonByNameResponse;

  @override
  set getPokemonByNameResponse(ApiResponse<PokemonDetailEntity> value) {
    _getPokemonByNameResponse = value;
    notifyListeners();
  }

  @override
  String getPokemonName() {
    return getPokemonByNameResponse.data.name;
  }

  @override
  String getSpeciesTypes() {
    return getPokemonByNameResponse.data.speciesTypes.map((t) => Utils.capitalize(t)).join(', ');
  }

  @override
  PokemonSize getPokemonSize() {
    var data = getPokemonByNameResponse.data;
    return PokemonSize(
      height: data.height.toString(),
      weight: data.weight.toString(),
      bmi: data.bmi.toStringAsFixed(1),
    );
  }

  @override
  PokemonAttributes getPokemonAttributes() {
    final BaseStatEntity baseStat = getPokemonByNameResponse.data.baseStat;
    final stats = PokemonAttributes(
      hp: baseStat.hp * 0.01,
      attack: baseStat.attack * 0.01,
      defense: baseStat.defense * 0.01,
      specialAttack: baseStat.specialAttack * 0.01,
      specialDefense: baseStat.specialDefense * 0.01,
      speed: baseStat.speed * 0.01,
      avgPower: baseStat.avgPower * 0.01,
    );
    return stats;
  }


  @override
  String getImageUrl() {
    return getPokemonByNameResponse.data.imageUrl;
  }

  @override
  Future<void> getPokemonByName({
    required String name,
  }) async {
    try {
      PokemonDetailEntity pokemonDetailEntity = await injector<GetPokemonByName>().execute(
        Params(
          name: name,
        ),
      );
      getPokemonByNameResponse = ApiResponse.completed(pokemonDetailEntity);
    } catch (e) {
      getPokemonByNameResponse = ApiResponse.error(e);
    }
  }
}
