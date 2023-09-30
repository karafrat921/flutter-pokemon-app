import 'package:flutter/material.dart';
import 'package:flutter_tdd_clean_architecture_mvvm/presentation/pages/other/coming_soon_page.dart';
import '../../core/enums/tab_item.dart';
import '../pages/pokemon/pokemon_page.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.tabItem,
  }) : super(key: key);
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (widget.tabItem == TabItem.pokemon) {
      child = const PokemonPage();
    } else if (widget.tabItem == TabItem.berries) {
      child = const ComingSoonPage();
    } else if (widget.tabItem == TabItem.locations) {
      child = const ComingSoonPage();
    } else {
      child = Container();
    }
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
