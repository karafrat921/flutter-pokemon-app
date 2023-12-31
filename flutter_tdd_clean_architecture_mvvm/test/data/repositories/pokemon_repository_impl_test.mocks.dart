// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_tdd_clean_architecture_mvvm/test/data/repositories/pokemon_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter_tdd_clean_architecture_mvvm/data/datasources/local_datasource/local_datasource.dart' as _i6;
import 'package:flutter_tdd_clean_architecture_mvvm/data/datasources/remote_datasource/remote_datasource.dart' as _i4;
import 'package:flutter_tdd_clean_architecture_mvvm/data/models/pokemon_detail_model.dart' as _i3;
import 'package:flutter_tdd_clean_architecture_mvvm/data/models/pokemon_list_model.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePokemonListModel_0 extends _i1.SmartFake implements _i2.PokemonListModel {
  _FakePokemonListModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePokemonDetailModel_1 extends _i1.SmartFake implements _i3.PokemonDetailModel {
  _FakePokemonDetailModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i4.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.PokemonListModel> getPokemon(String? url) => (super.noSuchMethod(
        Invocation.method(
          #getPokemon,
          [url],
        ),
        returnValue: _i5.Future<_i2.PokemonListModel>.value(_FakePokemonListModel_0(
          this,
          Invocation.method(
            #getPokemon,
            [url],
          ),
        )),
      ) as _i5.Future<_i2.PokemonListModel>);

  @override
  _i5.Future<_i3.PokemonDetailModel> getPokemonByName(String? name) => (super.noSuchMethod(
        Invocation.method(
          #getPokemonByName,
          [name],
        ),
        returnValue: _i5.Future<_i3.PokemonDetailModel>.value(_FakePokemonDetailModel_1(
          this,
          Invocation.method(
            #getPokemonByName,
            [name],
          ),
        )),
      ) as _i5.Future<_i3.PokemonDetailModel>);
}

/// A class which mocks [LocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSource extends _i1.Mock implements _i6.LocalDataSource {
  MockLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PokemonItem? isPokemonInFavorites(String? key) => (super.noSuchMethod(Invocation.method(
        #isPokemonInFavorites,
        [key],
      )) as _i2.PokemonItem?);

  @override
  _i5.Future<_i2.PokemonItem?> addPokemonByName(_i2.PokemonItem? pokemonItem) => (super.noSuchMethod(
        Invocation.method(
          #addPokemonByName,
          [pokemonItem],
        ),
        returnValue: _i5.Future<_i2.PokemonItem?>.value(),
      ) as _i5.Future<_i2.PokemonItem?>);

  @override
  _i5.Future<_i2.PokemonItem?> removePokemonByName(String? key) => (super.noSuchMethod(
        Invocation.method(
          #removePokemonByName,
          [key],
        ),
        returnValue: _i5.Future<_i2.PokemonItem?>.value(),
      ) as _i5.Future<_i2.PokemonItem?>);

  @override
  List<_i2.PokemonItem> getFavoritePokemonList() => (super.noSuchMethod(
        Invocation.method(
          #getFavoritePokemonList,
          [],
        ),
        returnValue: <_i2.PokemonItem>[],
      ) as List<_i2.PokemonItem>);

  @override
  _i5.Future<int> clearAllFavoritePokemon() => (super.noSuchMethod(
        Invocation.method(
          #clearAllFavoritePokemon,
          [],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);
}
