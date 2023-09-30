import 'package:flutter_tdd_clean_architecture_mvvm/data/models/pokemon_list_model.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/entities/pokemon_list_entity.dart';
import '../../data/models/pokemon_list_json_mock.dart';

PokemonListEntity mockPokemonListEntity = PokemonListModel.fromJson(mockPokemonListJson).convertToEntity();



