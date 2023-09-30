import '../../../core/api_helper/api_base_helper.dart';
import '../../../core/constants/constants.dart';
import '../../models/pokemon_detail_model.dart';
import '../../models/pokemon_list_model.dart';
import 'remote_datasource.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  final ApiBaseHelper apiBaseHelper;

  RemoteDataSourceImp({required this.apiBaseHelper});

  final Map<String, String> _header = {
    'Content-Type': 'application/json',
  };

  @override
  Future<PokemonListModel> getPokemon(String? url) async {
    var queryString = url ?? Constants.baseUrl;

    var response = await apiBaseHelper.get(url: queryString, header: _header);
    return PokemonListModel.fromJson(response);
  }

  @override
  Future<PokemonDetailModel> getPokemonByName(String name) async {
    String queryString = '${Constants.baseUrl}/$name';

    var response = await apiBaseHelper.get(url: queryString, header: _header);
    return PokemonDetailModel.fromJson(response);
  }
}
