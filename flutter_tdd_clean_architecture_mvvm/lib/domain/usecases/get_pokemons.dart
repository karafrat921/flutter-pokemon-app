import '../../core/usecase/base_usecase.dart';
import '../entities/pokemon_list_entity.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemon extends BaseUseCase<Future<PokemonListEntity>, ParamsForPokemon> {
  final PokemonRepository pokemonRepository;

  const GetPokemon(this.pokemonRepository);

  @override
  Future<PokemonListEntity> execute(ParamsForPokemon params) async {
    return await pokemonRepository.getPokemon(url: params.url);
  }
}

class ParamsForPokemon {
  final String? url;

  const ParamsForPokemon(
    this.url,
  );
}
