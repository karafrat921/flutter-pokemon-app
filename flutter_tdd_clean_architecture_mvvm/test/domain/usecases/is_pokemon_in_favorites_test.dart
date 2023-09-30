import 'package:flutter_tdd_clean_architecture_mvvm/domain/repositories/pokemon_repository.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/usecases/is_pokemon_in_favorites.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../entities/pokemon_item_entity_mock.dart';
import 'is_pokemon_in_favorites_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late IsPokemonInFavorites usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = IsPokemonInFavorites(mockPokemonRepository);
  });

  test("It should delete the Pokemon from the repository.", () async {
    // Arrange

    when(mockPokemonRepository.isPokemonInFavorites(key: "")).thenReturn(mockPokemonItemEntity);

    // Act
    final result = usecase.execute(const ParamsForIsPokemonInFavorites(""));

    // Assert
    expect(result, mockPokemonItemEntity);
    verify(mockPokemonRepository.isPokemonInFavorites(key: ""));
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
