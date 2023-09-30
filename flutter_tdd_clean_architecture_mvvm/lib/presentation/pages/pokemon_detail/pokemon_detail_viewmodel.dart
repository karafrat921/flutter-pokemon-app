import 'package:flutter/material.dart';
import '../../../core/api_helper/api_response.dart';
import '../../../domain/entities/pokemon_detail_entity.dart';
import 'pokemon_attributes.dart';
import 'pokemon_size.dart';

abstract class PokemonDetailViewModel with ChangeNotifier {
  ApiResponse<PokemonDetailEntity> get getPokemonByNameResponse;

  set getPokemonByNameResponse(ApiResponse<PokemonDetailEntity> value);

  Future<void> getPokemonByName({
    required String name,
  });

  String getPokemonName();

  String getSpeciesTypes();

  String getImageUrl();

  PokemonSize getPokemonSize();

  PokemonAttributes getPokemonAttributes();
}
