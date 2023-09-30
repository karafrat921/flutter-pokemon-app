import 'package:flutter_tdd_clean_architecture_mvvm/data/datasources/local_datasource/local_datasource.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/data/models/pokemon_detail_model.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/data/models/pokemon_list_model.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/domain/repositories/pokemon_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../domain/entities/pokemon_detail_entity_mock.dart';
import '../../domain/entities/pokemon_item_entity_mock.dart';
import '../../domain/entities/pokemon_list_entity_mock.dart';
import '../models/pokemon_detail_json_mock.dart';
import '../models/pokemon_list_json_mock.dart';
import 'pokemon_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteDataSource, LocalDataSource])
void main() {
  late PokemonRepository repository;
  MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
  MockLocalDataSource mockLocalDataSource = MockLocalDataSource();

  setUp(() {
    repository = PokemonRepositoryImpl(
      localDatasourceImp: mockLocalDataSource,
      remoteDataSourceImp: mockRemoteDataSource,
    );
  });

  group('getPokemons', () {
    test(
      "It should return a PokemonListModel.",
      () async {
        // arrange
        when(mockRemoteDataSource.getPokemon(any))
            .thenAnswer((_) async => PokemonListModel.fromJson(mockPokemonListJson));
        // act
        final result = await repository.getPokemon(url: null);
        // assert
        verify(mockRemoteDataSource.getPokemon(any));
        expect(result, mockPokemonListEntity);
      },
    );

    test(
      "It should return a PokemonDetailModel.",
      () async {
        // arrange
        when(mockRemoteDataSource.getPokemonByName(any))
            .thenAnswer((_) async => PokemonDetailModel.fromJson(mockPokemonDetailJson));
        // act
        final result = await repository.getPokemonByName("bulbasaur");
        // assert
        verify(mockRemoteDataSource.getPokemonByName(any));
        expect(result, mockPokemonDetailEntity);
      },
    );

    test(
      "It should return a PokemonItem?.",
      () {
        // arrange
        when(mockLocalDataSource.isPokemonInFavorites(any)).thenReturn(PokemonItem.fromJson(mockPokemonItemJson));

        // act
        final result = repository.isPokemonInFavorites(key: "bulbasaur");
        // assert
        verify(mockLocalDataSource.isPokemonInFavorites(any));
        expect(result, mockPokemonItemEntity);
      },
    );

    test(
      "It should return a PokemonItem?.",
      () async {
        when(mockLocalDataSource.addPokemonByName(any))
            .thenAnswer((_) => Future(() => PokemonItem.fromJson(mockPokemonItemJson)));
        final result = await repository.addPokemonByName(pokemonItemEntity: mockPokemonItemEntity);
        verify(mockLocalDataSource.addPokemonByName(any));
        expect(result, mockPokemonItemEntity);
      },
    );

    test("It should return a PokemonItem?.", () async {
      when(mockLocalDataSource.removePokemonByName(any))
          .thenAnswer((_) => Future(() => PokemonItem.fromJson(mockPokemonItemJson)));
      final result = await repository.removePokemonByName(
        key: "",
      );
      verify(mockLocalDataSource.removePokemonByName(any));
      expect(result, mockPokemonItemEntity);
    });

    test("It should return the number of deleted PokemonItem.", () async {
      // arrange
      when(mockLocalDataSource.clearAllFavoritePokemon()).thenAnswer((_) async => 0);
      // act
      final result = await repository.clearAllFavoritePokemon();
      // assert
      verify(mockLocalDataSource.clearAllFavoritePokemon());
      expect(result, 0);
    });

    test("It should return a List<PokemonItem>.", () {
      const mockPokemonItemList = [
        PokemonItem(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
        PokemonItem(name: 'ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/'),
      ];
      // arrange
      when(mockLocalDataSource.getFavoritePokemonList()).thenReturn(mockPokemonItemList);
      // act
      final result = repository.getFavoritePokemonList();
      // assert
      verify(mockLocalDataSource.getFavoritePokemonList());
      expect(result, mockPokemonItemEntityList);
    });
  });
}
