import 'package:equatable/equatable.dart';
import 'pokemon_item_entity.dart';

class PokemonListEntity extends Equatable {
  final String? next;
  final List<PokemonItemEntity> pokemons;

  const PokemonListEntity({required this.next, required this.pokemons});

  @override
  List<Object?> get props => [pokemons];
}
