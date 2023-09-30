import 'package:flutter_tdd_clean_architecture_mvvm/data/models/pokemon_list_model.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/entities/pokemon_item_entity.dart';
import '../../data/models/pokemon_list_json_mock.dart';

const List<PokemonItemEntity> mockPokemonItemEntityList = [
  PokemonItemEntity(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
  PokemonItemEntity(name: 'ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/')
];

PokemonItemEntity mockPokemonItemEntity = PokemonItem.fromJson(mockPokemonItemJson).convertToEntity();