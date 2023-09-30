import '../../core/usecase/base_usecase.dart';
import '../entities/pokemon_item_entity.dart';
import '../repositories/pokemon_repository.dart';

class ParamsForIsPokemonInFavorites {
  final String key;

  const ParamsForIsPokemonInFavorites(
    this.key,
  );
}

class IsPokemonInFavorites extends BaseUseCase<PokemonItemEntity?, ParamsForIsPokemonInFavorites> {
  final PokemonRepository pokemonRepository;

  const IsPokemonInFavorites(this.pokemonRepository);

  @override
  PokemonItemEntity? execute(ParamsForIsPokemonInFavorites params) {
    return pokemonRepository.isPokemonInFavorites(key: params.key);
  }
}
