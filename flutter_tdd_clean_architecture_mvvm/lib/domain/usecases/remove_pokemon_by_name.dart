import '../../core/usecase/base_usecase.dart';
import '../entities/pokemon_item_entity.dart';
import '../repositories/pokemon_repository.dart';

class ParamsKey {
  final String key;

  const ParamsKey(
    this.key,
  );
}

class RemovePokemonByName extends BaseUseCase<Future<PokemonItemEntity?>, ParamsKey> {
  final PokemonRepository pokemonRepository;

  const RemovePokemonByName(this.pokemonRepository);

  @override
  Future<PokemonItemEntity?> execute(ParamsKey params) async {
    return await pokemonRepository.removePokemonByName(key: params.key);
  }
}
