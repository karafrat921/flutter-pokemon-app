import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/keyboard_unfocus.dart';
import '../../../../domain/entities/pokemon_item_entity.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../widget/custom_grid_delegate.dart';
import '../../../widget/favorite_item_widget.dart';


class FavoritePokemonWidget extends StatefulWidget {
  final List<PokemonItemEntity> favoritePokemonList;

  const FavoritePokemonWidget({Key? key, required this.favoritePokemonList}) : super(key: key);

  @override
  State<FavoritePokemonWidget> createState() => _FavoritePokemonWidgetState();
}

class _FavoritePokemonWidgetState extends State<FavoritePokemonWidget> {
  late final TextEditingController _searchController;
  late List<PokemonItemEntity> _filteredPokemon;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredPokemon = [];
    _filteredPokemon = widget.favoritePokemonList;
    _searchController.addListener(_filterPokemonList);
  }

  void _filterPokemonList() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      _filteredPokemon =
          widget.favoritePokemonList.where((pokemon) => pokemon.name.toLowerCase().contains(searchText)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardFocus.unFocus(
      child: Column(
        children: [
          _searchPokemonWidget(),
          _buildExpanded(),
        ],
      ),
    );
  }

  Expanded _buildExpanded() {
    return Expanded(
      child: GridView.builder(
        itemCount: _filteredPokemon.length,
        padding: const EdgeInsets.all(12),
        scrollDirection: Axis.horizontal,
        gridDelegate: CustomGridDelegate(),
        itemBuilder: (context, index) {
          return FavoriteItemWidget(
            name: _filteredPokemon[index].name,
            index: index.toString(),
            url: _filteredPokemon[index].url,
          );
        },
      ),
    );
  }

  Padding _searchPokemonWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: LocaleKeys.pokemon_search_pokemon.tr(),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
