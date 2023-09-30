import 'package:equatable/equatable.dart';

class PokemonItemEntity extends Equatable {
  final String name;
  final String url;

  const PokemonItemEntity({required this.name, required this.url});

  @override
  List<Object?> get props => [name,url];
}
