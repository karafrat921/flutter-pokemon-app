import 'package:flutter/material.dart';
import '../../core/enums/tab_item.dart';
import '../widget/are_you_sure_exit_popup.dart';
import 'bottom_navigation.dart';
import 'tab_navigator.dart';

class App extends StatefulWidget  {
   const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _currentTab = TabItem.pokemon;
  final _navigatorKeys = {
    TabItem.pokemon: GlobalKey<NavigatorState>(),
    TabItem.berries: GlobalKey<NavigatorState>(),
    TabItem.locations: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.pokemon) {
            _selectTab(TabItem.pokemon);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: AreYouSureExitPopup(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              _buildOffstageNavigator(TabItem.pokemon),
              _buildOffstageNavigator(TabItem.berries),
              _buildOffstageNavigator(TabItem.locations),
            ],
          ),
          bottomNavigationBar: BottomNavigation(
            currentTab: _currentTab,
            onSelectTab: _selectTab,
          ),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    setState(() {});
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
