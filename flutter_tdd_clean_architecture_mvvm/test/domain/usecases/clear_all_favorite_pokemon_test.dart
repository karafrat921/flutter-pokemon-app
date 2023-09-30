import 'package:flutter_tdd_clean_architecture_mvvm/domain/repositories/pokemon_repository.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/usecases/clear_all_favorite_pokemon.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'clear_all_favorite_pokemon_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late ClearAllFavoritePokemon usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = ClearAllFavoritePokemon(mockPokemonRepository);
  });

  test("It should indicate how many Pokemon were deleted.", () async {
    // Arrange
    when(mockPokemonRepository.clearAllFavoritePokemon()).thenAnswer((_) async => 2);

    // Act
    final result = await usecase.execute(const Params());

    // Assert
    expect(result, 2);
    verify(mockPokemonRepository.clearAllFavoritePokemon());
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
