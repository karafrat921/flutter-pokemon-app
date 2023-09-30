import 'package:flutter_tdd_clean_architecture_mvvm/domain/repositories/pokemon_repository.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/usecases/remove_pokemon_by_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../entities/pokemon_item_entity_mock.dart';
import 'remove_pokemon_by_name_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {

  late RemovePokemonByName usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = RemovePokemonByName(mockPokemonRepository);
  });

  test('Add Pokemon By Name Use Case', () async {
    // Arrange
    when(mockPokemonRepository.removePokemonByName(key: ""))
        .thenAnswer((_) async => mockPokemonItemEntity);

    // Act
    final result = await usecase.execute(ParamsKey(""));

    // Assert
    expect(result, mockPokemonItemEntity);
    verify(mockPokemonRepository.removePokemonByName(key: ""));
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
