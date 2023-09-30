import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/enums/tab_item.dart';
import '../../translations/locale_keys.g.dart';
import 'tab_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key, required this.currentTab, required this.onSelectTab}) : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    TextStyle selectedTextStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.w600);
    TextStyle unSelectedTextStyle = const TextStyle(fontSize: 11, fontWeight: FontWeight.w500);
    return BottomNavigationBar(
      selectedLabelStyle: selectedTextStyle,
      unselectedLabelStyle: unSelectedTextStyle,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.pokemon, context),
        _buildItem(TabItem.berries, context),
        _buildItem(TabItem.locations, context),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: Theme.of(context).primaryColor,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem, context) {
    Map<TabItem, String> tabName = {
      TabItem.pokemon: LocaleKeys.bottom_pokemon.tr(),
      TabItem.berries: LocaleKeys.bottom_berry.tr(),
      TabItem.locations: LocaleKeys.bottom_locations.tr(),
    };

    return BottomNavigationBarItem(
      icon: Container(
        height: 20,
        margin: const EdgeInsets.all(4),
        child: SvgPicture.asset(
          tabIconPath[tabItem]!,
          color: _colorTabMatching(tabItem, context),
        ),
      ),
      label: tabName[tabItem],
    );
  }

  Color _colorTabMatching(TabItem item, BuildContext context) {
    return currentTab == item ? Theme.of(context).primaryColor : Colors.grey;
  }
}
