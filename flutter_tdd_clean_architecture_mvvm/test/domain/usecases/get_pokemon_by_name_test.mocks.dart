// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_tdd_clean_architecture_mvvm/test/domain/usecases/get_pokemon_by_name_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter_tdd_clean_architecture_mvvm/domain/entities/pokemon_detail_entity.dart'
    as _i3;
import 'package:flutter_tdd_clean_architecture_mvvm/domain/entities/pokemon_item_entity.dart'
    as _i6;
import 'package:flutter_tdd_clean_architecture_mvvm/domain/entities/pokemon_list_entity.dart'
    as _i2;
import 'package:flutter_tdd_clean_architecture_mvvm/domain/repositories/pokemon_repository.dart'
    as _i4;
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

class _FakePokemonListEntity_0 extends _i1.SmartFake
    implements _i2.PokemonListEntity {
  _FakePokemonListEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePokemonDetailEntity_1 extends _i1.SmartFake
    implements _i3.PokemonDetailEntity {
  _FakePokemonDetailEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PokemonRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonRepository extends _i1.Mock implements _i4.PokemonRepository {
  MockPokemonRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.PokemonListEntity> getPokemon({required String? url}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemon,
          [],
          {#url: url},
        ),
        returnValue:
            _i5.Future<_i2.PokemonListEntity>.value(_FakePokemonListEntity_0(
          this,
          Invocation.method(
            #getPokemon,
            [],
            {#url: url},
          ),
        )),
      ) as _i5.Future<_i2.PokemonListEntity>);
  @override
  _i6.PokemonItemEntity? isPokemonInFavorites({required String? key}) =>
      (super.noSuchMethod(Invocation.method(
        #isPokemonInFavorites,
        [],
        {#key: key},
      )) as _i6.PokemonItemEntity?);
  @override
  _i5.Future<_i6.PokemonItemEntity?> addPokemonByName(
          {required _i6.PokemonItemEntity? pokemonItemEntity}) =>
      (super.noSuchMethod(
        Invocation.method(
          #addPokemonByName,
          [],
          {#pokemonItemEntity: pokemonItemEntity},
        ),
        returnValue: _i5.Future<_i6.PokemonItemEntity?>.value(),
      ) as _i5.Future<_i6.PokemonItemEntity?>);
  @override
  _i5.Future<_i6.PokemonItemEntity?> removePokemonByName(
          {required String? key}) =>
      (super.noSuchMethod(
        Invocation.method(
          #removePokemonByName,
          [],
          {#key: key},
        ),
        returnValue: _i5.Future<_i6.PokemonItemEntity?>.value(),
      ) as _i5.Future<_i6.PokemonItemEntity?>);
  @override
  _i5.Future<int> clearAllFavoritePokemon() => (super.noSuchMethod(
        Invocation.method(
          #clearAllFavoritePokemon,
          [],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);
  @override
  _i5.Future<_i3.PokemonDetailEntity> getPokemonByName(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonByName,
          [name],
        ),
        returnValue: _i5.Future<_i3.PokemonDetailEntity>.value(
            _FakePokemonDetailEntity_1(
          this,
          Invocation.method(
            #getPokemonByName,
            [name],
          ),
        )),
      ) as _i5.Future<_i3.PokemonDetailEntity>);
  @override
  List<_i6.PokemonItemEntity> getFavoritePokemonList() => (super.noSuchMethod(
        Invocation.method(
          #getFavoritePokemonList,
          [],
        ),
        returnValue: <_i6.PokemonItemEntity>[],
      ) as List<_i6.PokemonItemEntity>);
}
