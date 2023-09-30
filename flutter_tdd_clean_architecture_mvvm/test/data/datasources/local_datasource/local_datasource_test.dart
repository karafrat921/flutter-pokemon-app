import 'package:flutter_tdd_clean_architecture_mvvm/data/datasources/local_datasource/local_datasource.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/data/datasources/local_datasource/local_datasource_imp.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/data/models/pokemon_list_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:hive_flutter/hive_flutter.dart' as hive;
import 'package:mockito/mockito.dart';

import 'local_datasource_test.mocks.dart';

@GenerateMocks([hive.Box])
void main() {
  late LocalDataSource localDataSource;
  late MockBox mockBox;

  setUpAll(() {
    mockBox = MockBox();
    localDataSource = LocalDataSourceImp(box: mockBox);
  });

  group('LocalDatasource', () {
    test('isPokemonInFavorites should return PokemonItem if it exists in favorites', () {
      // Arrange
      when(mockBox.get(any)).thenReturn(const PokemonItem(name: "name", url: "url"));

      // Act
      final result = localDataSource.isPokemonInFavorites('name');

      verify(mockBox.get(any));

      // Assert
      expect(const PokemonItem(name: "name", url: "url"), result);
    });

    test('isPokemonInFavorites should return null if it does not exist in favorites', () {
      // Arrange
      when(mockBox.get(any)).thenReturn(null);

      // Act
      final result = localDataSource.isPokemonInFavorites('name');

      verify(mockBox.get(any));

      // Assert
      expect(null, result);
    });

    test('addPokemonByName should add a Pokemon to favorites', () async {
      // Arrange
      when(mockBox.put(any, any)).thenAnswer((_) => Future.value());
      when(mockBox.get(any)).thenReturn(const PokemonItem(name: "name", url: "url"));

      // Act
      final result = await localDataSource.addPokemonByName(const PokemonItem(name: "name", url: "url"));

      verify(mockBox.put(any, any));
      verify(mockBox.get(any));
      // Assert
      expect(const PokemonItem(name: "name", url: "url"), result);
    });

    test('addPokemonByName should return null if adding fails', () async {
      // Arrange
      when(mockBox.put(any, any)).thenAnswer((_) => Future.value());
      when(mockBox.get(any)).thenReturn(null);

      // Act
      final result = await localDataSource.addPokemonByName(const PokemonItem(name: "name", url: "url"));

      verify(mockBox.put(any, any));
      verify(mockBox.get(any));
      // Assert
      expect(null, result);
    });

    test('removePokemonByName should remove a Pokemon from favorites', () async {
      // Arrange
      when(mockBox.delete(any)).thenAnswer((_) => Future.value());
      when(mockBox.get(any)).thenReturn(null);

      // Act
      final result = await localDataSource.removePokemonByName("name");

      verify(mockBox.delete(any));
      verify(mockBox.get(any));
      // Assert
      expect(null, result);
    });

    test('getFavoritePokemonList should return a list of favorite Pokemon', () async {
      // Arrange
      when(mockBox.keys).thenReturn(['Pikachu', 'Charizard']);
      when(mockBox.get('Pikachu')).thenReturn(const PokemonItem(name: 'Pikachu', url: 'https://...'));
      when(mockBox.get('Charizard')).thenReturn(const PokemonItem(name: 'Charizard', url: 'https://...'));

      // Act
      final result = localDataSource.getFavoritePokemonList();

      verify(mockBox.get(any));
      // Assert
      expect(result.length, 2);
      expect(result[0].name, 'Pikachu');
      expect(result[1].name, 'Charizard');
    });

    test('clearAllFavoritePokemon should clear all favorite Pokemon', () async {
      // Arrange
      when(mockBox.clear()).thenAnswer((_) async => 0);

      // Act
      final result = await localDataSource.clearAllFavoritePokemon();

      // Assert
      expect(result, 0);

      verify(mockBox.clear()).called(1);
    });
  });
}
