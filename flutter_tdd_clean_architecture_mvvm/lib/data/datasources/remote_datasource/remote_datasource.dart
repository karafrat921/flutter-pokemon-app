import '../../models/pokemon_detail_model.dart';
import '../../models/pokemon_list_model.dart';

abstract class RemoteDataSource {
  Future<PokemonListModel> getPokemon(String? url);

  Future<PokemonDetailModel> getPokemonByName(String name);
}
