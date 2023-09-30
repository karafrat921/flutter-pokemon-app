import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/core/extension/response_event.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/core/extension/router.dart';
import '../../../../core/api_helper/api_response.dart';
import '../../../../core/enums/snack_bar_type.dart';
import '../../../../core/utils/utils.dart';
import '../../../../main.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../widget/custom_loading_widget.dart';
import '../../../widget/error_widget.dart';
import '../../../widget/item_widget.dart';
import '../../pokemon_detail/pokemon_detail_page.dart';
import '../pokemon_viewmodel.dart';

class AllPokemonWidget extends ConsumerStatefulWidget {
  const AllPokemonWidget({super.key});

  @override
  ConsumerState createState() => _AllPokemonWidgetState();
}

class _AllPokemonWidgetState extends ConsumerState<AllPokemonWidget> {
  Widget _getPokemon({required PokemonViewModel pokemonViewModel}) {
    switch (pokemonViewModel.pokemonListResponse.status) {
      case Status.loading:
        {
          return const CustomLoadingWidget();
        }
      case Status.completed:
        {
          return ListView.builder(
            itemCount: pokemonViewModel.pokemonListLength(),
            itemBuilder: (context, index) {
              return _itemWidget(pokemonViewModel, index, context);
            },
          );
        }

      default:
        {
          return const SizedBox();
        }
    }
  }

  Widget _itemWidget(PokemonViewModel pokemonViewModel, int index, BuildContext context) {
    var pokemonNameByIndex = pokemonViewModel.getPokemonNameByIndex(index);
    var pokemonInFavorites = pokemonViewModel.isPokemonInFavorites(pokemonNameByIndex);

    return ItemWidget(
      onTap: () {
        PokemonDetailPage(name: pokemonNameByIndex).scaleTransitionPush(context: context);
        //PokemonDetailPage(name: "forError").scaleTransitionPush(context: context);
      },
      title: pokemonNameByIndex,
      subtitle: index.toString(),
      isActive: pokemonInFavorites,
      favoriteButton: () {
        if (!pokemonInFavorites) {
          pokemonViewModel
              .addPokemonByName(index)
              .then((value) => _showMessage(context, LocaleKeys.pokemon_saved_to_favorites.tr()));
        } else {
          pokemonViewModel
              .removePokemonByName(index)
              .then((value) => _showMessage(context, LocaleKeys.pokemon_deleted_from_favorites.tr()));
        }
      },
    );
  }

  void _showMessage(BuildContext context, String message) {
    return Utils.showMessage(
      message: message,
      context: context,
      snackBarType: SnackBarType.success,
    );
  }

  @override
  Widget build(BuildContext context) {
    PokemonViewModel pokemonViewModel = ref.watch(pokemonViewModelImp);

    return pokemonViewModel.pokemonListResponse.isError()
        ? CustomErrorWidget(
            title: LocaleKeys.pokemon_an_error_occurred.tr(),
            description: LocaleKeys.pokemon_try_again.tr(),
            onTap: () {
              pokemonViewModel.getPokemon();
            },
          )
        : _getPokemon(pokemonViewModel: pokemonViewModel);
  }
}
