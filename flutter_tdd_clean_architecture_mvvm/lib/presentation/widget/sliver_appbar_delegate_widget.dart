import 'package:flutter/material.dart';

class SliverAppBarDelegateWidget extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegateWidget(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegateWidget oldDelegate) {
    return false;
  }
}