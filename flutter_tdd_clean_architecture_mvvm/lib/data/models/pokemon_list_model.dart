import '../../domain/entities/pokemon_item_entity.dart';
import '../../domain/entities/pokemon_list_entity.dart';
import 'package:hive_flutter/adapters.dart';
part 'pokemon_list_model.g.dart';

class PokemonListModel {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonItem> results;

  PokemonListModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonListModel.fromJson(Map<String, dynamic> json) => PokemonListModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonItem>.from(json["results"].map((x) => PokemonItem.fromJson(x))),
      );

  PokemonListEntity convertToEntity() {
    return PokemonListEntity(
      next: next,
      pokemons: results,
    );
  }
}

@HiveType(typeId: 0)
class PokemonItem extends PokemonItemEntity{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;

  const PokemonItem({
    required this.name,
    required this.url,
  }):super(name: name,url: url);

  factory PokemonItem.fromJson(Map<String, dynamic> json) => PokemonItem(
        name: json["name"],
        url: json["url"],
      );

  PokemonItemEntity convertToEntity() {
    return PokemonItemEntity(
      url: url,
      name: name,
    );
  }
}
