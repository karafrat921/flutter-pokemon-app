import '../../core/usecase/base_usecase.dart';
import '../repositories/pokemon_repository.dart';

class Params {
  const Params();
}

class ClearAllFavoritePokemon extends BaseUseCase<Future<int>, Params> {
  final PokemonRepository pokemonRepository;

  const ClearAllFavoritePokemon(this.pokemonRepository);

  @override
  Future<int> execute(Params params) async {
    return await pokemonRepository.clearAllFavoritePokemon();
  }
}
