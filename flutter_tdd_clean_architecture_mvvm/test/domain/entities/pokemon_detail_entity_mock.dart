import 'package:flutter_tdd_clean_architecture_mvvm/data/models/pokemon_detail_model.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/entities/pokemon_detail_entity.dart';
import '../../data/models/pokemon_detail_json_mock.dart';

PokemonDetailEntity mockPokemonDetailEntity = PokemonDetailModel.fromJson(mockPokemonDetailJson).convertToEntity();
