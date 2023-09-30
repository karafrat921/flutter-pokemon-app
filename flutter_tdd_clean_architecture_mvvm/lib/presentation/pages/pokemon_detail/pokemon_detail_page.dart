import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/core/extension/response_event.dart';
import '../../../core/api_helper/api_response.dart';
import '../../../core/constants/assets.dart';
import '../../../main.dart';
import '../../../translations/locale_keys.g.dart';
import '../../widget/animated_percentage_indicator.dart';
import '../../widget/custom_loading_widget.dart';
import '../../widget/error_widget.dart';
import 'pokemon_detail_viewmodel.dart';

class PokemonDetailPage extends ConsumerStatefulWidget {
  final String name;

  const PokemonDetailPage({super.key, required this.name});

  @override
  ConsumerState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends ConsumerState<PokemonDetailPage> {
  @override
  void deactivate() {
    super.deactivate();
    ref.read(pokemonDetailViewModelImp).getPokemonByNameResponse.toLoading();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _getPokemonByName({required PokemonDetailViewModel pokemonDetailViewModel}) {
    switch (pokemonDetailViewModel.getPokemonByNameResponse.status) {
      case Status.loading:
        {
          pokemonDetailViewModel.getPokemonByName(name: widget.name);
          return const CustomLoadingWidget();
        }
      case Status.completed:
        {
          return CustomScrollView(
            slivers: <Widget>[
              _sliverAppBar(pokemonDetailViewModel),
              _sliverPadding(pokemonDetailViewModel),
            ],
          );
        }

      default:
        {
          return const SizedBox();
        }
    }
  }

  SliverPadding _sliverPadding(PokemonDetailViewModel pokemonDetailViewModel) {
    return SliverPadding(
      padding: const EdgeInsets.all(12),
      sliver: SliverGrid(
        delegate: SliverChildListDelegate(
          [
            AnimatedPercentageIndicator(
              percent: pokemonDetailViewModel.getPokemonAttributes().hp,
              txt: LocaleKeys.pokemon_hp.tr(),
            ),
            AnimatedPercentageIndicator(
              percent: pokemonDetailViewModel.getPokemonAttributes().attack,
              txt: LocaleKeys.pokemon_attack.tr(),
            ),
            AnimatedPercentageIndicator(
              percent: pokemonDetailViewModel.getPokemonAttributes().defense,
              txt: LocaleKeys.pokemon_defense.tr(),
            ),
            AnimatedPercentageIndicator(
              percent: pokemonDetailViewModel.getPokemonAttributes().specialAttack,
              txt: LocaleKeys.pokemon_special_attack.tr(),
            ),
            AnimatedPercentageIndicator(
              percent: pokemonDetailViewModel.getPokemonAttributes().specialDefense,
              txt: LocaleKeys.pokemon_special_defense.tr(),
            ),
            AnimatedPercentageIndicator(
              percent: pokemonDetailViewModel.getPokemonAttributes().speed,
              txt: LocaleKeys.pokemon_speed.tr(),
            ),
            AnimatedPercentageIndicator(
              percent: pokemonDetailViewModel.getPokemonAttributes().avgPower,
              txt: LocaleKeys.pokemon_average_power.tr(),
            ),
          ],
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }

  SliverAppBar _sliverAppBar(PokemonDetailViewModel pokemonDetailViewModel) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: _richText(pokemonDetailViewModel),
        background: _stack(pokemonDetailViewModel),
      ),
    );
  }

  RichText _richText(PokemonDetailViewModel pokemonDetailViewModel) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: "${pokemonDetailViewModel.getPokemonName()} ",
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
          ),
          TextSpan(
            text: pokemonDetailViewModel.getSpeciesTypes(),
            style: TextStyle(fontWeight: FontWeight.w200, color: Colors.grey.shade200, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Stack _stack(PokemonDetailViewModel pokemonDetailViewModel) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FadeInImage(
          placeholder: const AssetImage(Assets.loading),
          image: NetworkImage(pokemonDetailViewModel.getImageUrl()),
          fadeInDuration: const Duration(milliseconds: 200),
          fadeOutDuration: const Duration(milliseconds: 200),
          fit: BoxFit.contain,
          placeholderFit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          top: 0,
          right: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _getText("${LocaleKeys.pokemon_height.tr()} ${pokemonDetailViewModel.getPokemonSize().height}"),
              _getText("${LocaleKeys.pokemon_weight.tr()} ${pokemonDetailViewModel.getPokemonSize().weight}"),
              _getText("${LocaleKeys.pokemon_bmi.tr()} ${pokemonDetailViewModel.getPokemonSize().bmi}"),
            ],
          ),
        )
      ],
    );
  }

  Text _getText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 12,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pokemonDetailViewModel = ref.watch(pokemonDetailViewModelImp);

    return SafeArea(
      child: Scaffold(
        appBar: pokemonDetailViewModel.getPokemonByNameResponse.isError() ? _errorAppBar() : null,
        body: _body(pokemonDetailViewModel),
      ),
    );
  }

  Widget _body(PokemonDetailViewModel pokemonDetailViewModel) {
    if (pokemonDetailViewModel.getPokemonByNameResponse.isError()) {
      return CustomErrorWidget(
        title: LocaleKeys.pokemon_occurred_pokemon,
        description: LocaleKeys.pokemon_try_again.tr(),
        onTap: () {
          pokemonDetailViewModel.getPokemonByName(name: widget.name);
        },
      );
    } else {
      return _getPokemonByName(pokemonDetailViewModel: pokemonDetailViewModel);
    }
  }

  AppBar _errorAppBar() {
    return AppBar(
      title: Text(LocaleKeys.pokemon_detail_page.tr()),
    );
  }
}
