import 'package:flutter_tdd_clean_architecture_mvvm/core/api_helper/api_base_helper.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/core/constants/constants.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/data/datasources/remote_datasource/remote_datasource_imp.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/data/models/pokemon_detail_model.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/data/models/pokemon_list_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../models/pokemon_detail_json_mock.dart';
import '../../models/pokemon_list_json_mock.dart';
import 'remote_datasource_test.mocks.dart';

@GenerateMocks([ApiBaseHelper])
void main() {
  late RemoteDataSourceImp remoteDataSource;
  late MockApiBaseHelper mockApiBaseHelper;

  setUp(() {
    mockApiBaseHelper = MockApiBaseHelper();
    remoteDataSource = RemoteDataSourceImp(apiBaseHelper: mockApiBaseHelper);
  });

  group('getPokemon', () {
    const testUrl = 'test_url';
    const testResponse = mockPokemonListJson;
    final testPokemonListModel = PokemonListModel.fromJson(testResponse);

    test('should perform a GET request to the API at least once', () async {
      // Arrange
      when(mockApiBaseHelper.get(url: testUrl, header: anyNamed('header'))).thenAnswer((_) async => testResponse);

      // Act
        await remoteDataSource.getPokemon(testUrl);

      // Assert
      verify(mockApiBaseHelper.get(url: testUrl, header: anyNamed('header'))).called(1);
    });

    test('should return a PokemonListModel when the request is successful', () async {
      // Arrange
      when(mockApiBaseHelper.get(url: testUrl, header: anyNamed('header'))).thenAnswer((_) async => testResponse);

      // Act
      final result = await remoteDataSource.getPokemon(testUrl);

      // Assert
      expect(result.count, testPokemonListModel.count);
    });
  });

  group('getPokemonByName', () {
    const testName = 'test_name';
    const testResponse = mockPokemonDetailJson;
    final testPokemonDetailModel = PokemonDetailModel.fromJson(testResponse);

    test('should perform a GET request to the API with the correct URL at least once', () async {
      // Arrange
      const expectedUrl = '${Constants.baseUrl}/$testName';
      when(mockApiBaseHelper.get(url: expectedUrl, header: anyNamed('header')))
          .thenAnswer((_) async => testResponse);

      // Act
      await remoteDataSource.getPokemonByName(testName);

      // Assert
      verify(mockApiBaseHelper.get(url: expectedUrl, header: anyNamed('header')))
          .called(1);
    });

    test('should return a PokemonDetailModel when the request is successful', () async {
      // Arrange
      when(mockApiBaseHelper.get(url: anyNamed('url'), header: anyNamed('header')))
          .thenAnswer((_) async => testResponse);

      // Act
      final result = await remoteDataSource.getPokemonByName(testName);

      // Assert
      expect(result, equals(testPokemonDetailModel));
    });
  });
}
