import '../../core/usecase/base_usecase.dart';
import '../entities/pokemon_detail_entity.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonByName extends BaseUseCase<Future<PokemonDetailEntity>, Params> {
  final PokemonRepository pokemonRepository;

  const GetPokemonByName(this.pokemonRepository);

  @override
  Future<PokemonDetailEntity> execute(Params params) async {
    return await pokemonRepository.getPokemonByName(params.name);
  }
}

class Params {
  final String name;

  const Params({
    required this.name,
  });
}
