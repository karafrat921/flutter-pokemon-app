

import 'package:flutter_tdd_clean_architecture_mvvm/domain/repositories/pokemon_repository.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/usecases/get_pokemon_by_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../entities/pokemon_detail_entity_mock.dart';
import 'get_pokemon_by_name_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetPokemonByName usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemonByName(mockPokemonRepository);
  });

  test("It should return the Pokemon based on the given name.", () async {
    // Arrange
    when(mockPokemonRepository.getPokemonByName("test"))
        .thenAnswer((_) async => mockPokemonDetailEntity);

    // Act
    final result = await usecase.execute(const Params(name: "test"));

    // Assert
    expect(result, mockPokemonDetailEntity);
    verify(mockPokemonRepository.getPokemonByName("test"));
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
