import 'package:flutter_tdd_clean_architecture_mvvm/domain/repositories/pokemon_repository.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/usecases/get_favori_pokemon_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../entities/pokemon_item_entity_mock.dart';
import 'get_favori_pokemon_list_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetPokemonItemList usecase;
  late MockPokemonRepository mockPokemonRepository;

  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
    usecase = GetPokemonItemList(mockPokemonRepository);
  });

  test("It should fetch the Pokemon from the repository.", () async {
    // Arrange

    when(mockPokemonRepository.getFavoritePokemonList()).thenReturn(mockPokemonItemEntityList);

    // Act
    final result = usecase.execute(const ParamsGetFavoriPokemonList());

    // Assert
    expect(result, mockPokemonItemEntityList);
    verify(mockPokemonRepository.getFavoritePokemonList());
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
