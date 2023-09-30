import 'package:flutter_tdd_clean_architecture_mvvm/data/models/pokemon_list_model.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/repositories/pokemon_repository.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/usecases/add_pokemon_by_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../data/models/pokemon_list_json_mock.dart';
import '../entities/pokemon_item_entity_mock.dart';
import 'add_pokemon_by_name_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late AddPokemonByName usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = AddPokemonByName(mockPokemonRepository);
  });

  test("It should retrieve the Pokemon it added to the repository.", () async {
    // Arrange
    when(mockPokemonRepository.addPokemonByName(pokemonItemEntity: mockPokemonItemEntity))
        .thenAnswer((_) async => mockPokemonItemEntity);

    // Act
    final result = await usecase.execute(ParamsAddPokemon(mockPokemonItemEntity));

    // Assert
    expect(result, mockPokemonItemEntity);
    verify(mockPokemonRepository.addPokemonByName(pokemonItemEntity: mockPokemonItemEntity));
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
