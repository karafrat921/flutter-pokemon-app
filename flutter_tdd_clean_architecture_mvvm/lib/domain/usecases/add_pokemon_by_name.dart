import '../../core/usecase/base_usecase.dart';
import '../entities/pokemon_item_entity.dart';
import '../repositories/pokemon_repository.dart';

class ParamsAddPokemon {
  final PokemonItemEntity pokemonItemEntity;

  const ParamsAddPokemon(this.pokemonItemEntity,);
}

class AddPokemonByName extends BaseUseCase<Future<PokemonItemEntity?>, ParamsAddPokemon> {
  final PokemonRepository pokemonRepository;

  const AddPokemonByName(this.pokemonRepository);

  @override
  Future<PokemonItemEntity?> execute(ParamsAddPokemon params) async {
    return await pokemonRepository.addPokemonByName(pokemonItemEntity: params.pokemonItemEntity);
  }
}