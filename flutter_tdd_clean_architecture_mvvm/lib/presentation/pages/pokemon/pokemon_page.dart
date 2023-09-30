import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/assets.dart';
import '../../../core/enums/snack_bar_type.dart';
import '../../../core/utils/utils.dart';
import '../../../main.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widget/custom_floating_action_button.dart';
import '../../widget/custom_sliver_appbar.dart';
import '../../widget/visibility_widget.dart';
import 'components/all_pokemon_widget.dart';
import 'components/favorite_pokemon_widget.dart';
import 'pokemon_viewmodel.dart';

class PokemonPage extends ConsumerStatefulWidget {
  const PokemonPage({super.key});

  @override
  ConsumerState createState() => _PokemonPageState();
}

class _PokemonPageState extends ConsumerState<PokemonPage> with SingleTickerProviderStateMixin {
  late int _clickTabIndex;
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _clickTabIndex = 0;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var pokemonViewModel = ref.watch(pokemonViewModelImp);

    return Scaffold(
      floatingActionButton: _floatingActionButton(pokemonViewModel),
      body: Stack(
        children: [
          _buildDefaultTabController(pokemonViewModel),
          CustomVisibilityWidget(visible: pokemonViewModel.isDataFetching)
        ],
      ),
    );
  }

  DefaultTabController _buildDefaultTabController(PokemonViewModel pokemonViewModel) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool _) {
          return <Widget>[
            _buildCustomSliverAppBar(),
            _buildCustomSliverPersistentHeader(),
          ];
        },
        body: _getBody(pokemonViewModel),
      ),
    );
  }

  CustomSliverAppBar _buildCustomSliverAppBar() {
    return CustomSliverAppBar(
      customTitle: LocaleKeys.pokemon_pokemon.tr(),
      path: Assets.pokeBall,
    );
  }

  CustomSliverPersistentHeader _buildCustomSliverPersistentHeader() {
    return CustomSliverPersistentHeader(
      tabController: _tabController,
      onTap: (value) {
        setState(() {
          _clickTabIndex = value;
        });
      },
      tabList: [
        CustomTab(customIcon: const Icon(Icons.list), customText: LocaleKeys.pokemon_all_pokemon.tr()),
        CustomTab(customIcon: const Icon(Icons.lightbulb_outline), customText: LocaleKeys.pokemon_all_favorites.tr()),
      ],
    );
  }

  StatefulWidget _getBody(PokemonViewModel pokemonViewModel) {
    return _clickTabIndex == 0
        ? const AllPokemonWidget()
        : FavoritePokemonWidget(
            favoritePokemonList: pokemonViewModel.getPokemonItemList(),
          );
  }

  CustomFloatingActionButton? _floatingActionButton(PokemonViewModel pokemonViewModel) {
    if (pokemonViewModel.isDataFetching) {
      return null;
    }

    final bool isTabIndexZero = _clickTabIndex == 0;
    return CustomFloatingActionButton(
      onPressed: isTabIndexZero
          ? () {
              pokemonViewModel.getPokemon();
            }
          : () {
              pokemonViewModel.clearAllFavoritePokemon().then((value) {
                Utils.showMessage(
                  message: LocaleKeys.pokemon_successful.tr(),
                  context: context,
                  snackBarType: SnackBarType.success,
                );
                _clickTabIndex = 0;
                _tabController.index = _clickTabIndex;
              });
            },
      title: isTabIndexZero ? LocaleKeys.pokemon_ekstra.tr() : LocaleKeys.pokemon_delete.tr(),
    );
  }
}
