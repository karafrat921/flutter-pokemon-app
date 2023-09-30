import '../../core/usecase/base_usecase.dart';
import '../entities/pokemon_item_entity.dart';
import '../repositories/pokemon_repository.dart';

class ParamsGetFavoriPokemonList {

  const ParamsGetFavoriPokemonList();
}

class GetPokemonItemList extends BaseUseCase<List<PokemonItemEntity>, ParamsGetFavoriPokemonList> {
  final PokemonRepository pokemonRepository;

  const GetPokemonItemList(this.pokemonRepository);

  @override
  List<PokemonItemEntity> execute(ParamsGetFavoriPokemonList params) {
    return pokemonRepository.getFavoritePokemonList();
  }
}