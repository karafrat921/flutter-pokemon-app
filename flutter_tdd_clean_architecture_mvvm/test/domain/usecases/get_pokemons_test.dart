
import 'package:flutter_tdd_clean_architecture_mvvm/domain/repositories/pokemon_repository.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/usecases/get_pokemons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../entities/pokemon_list_entity_mock.dart';
import 'get_pokemons_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetPokemon usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemon(mockPokemonRepository);
  });

  test("It fetches the Pokemon from the repository.", () async {
    // Arrange
    when(mockPokemonRepository.getPokemon(url: null))
        .thenAnswer((_) async => mockPokemonListEntity);

    // Act
    final result = await usecase.execute(const ParamsForPokemon(null));

    // Assert
    expect(result, mockPokemonListEntity);
    verify(mockPokemonRepository.getPokemon(url: null));
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
