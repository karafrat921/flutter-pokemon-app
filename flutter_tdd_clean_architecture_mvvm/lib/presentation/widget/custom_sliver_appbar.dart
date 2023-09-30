import 'package:flutter/material.dart';
import 'sliver_appbar_delegate_widget.dart';

class CustomSliverAppBar extends SliverAppBar {
  final String customTitle;
  final String path;

  CustomSliverAppBar({super.key, required this.customTitle, required this.path})
      : super(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(customTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                )),
            background: Image.asset(
              path,
              fit: BoxFit.cover,
            ),
          ),
        );
}

class CustomSliverPersistentHeader extends SliverPersistentHeader {
  final TabController tabController;
  final Function(int)? onTap;
  final List<CustomTab> tabList;

  CustomSliverPersistentHeader({
    super.key,
    required this.tabController,
    required this.onTap,
    required this.tabList,
  }) : super(
          delegate: SliverAppBarDelegateWidget(
            TabBar(
              controller: tabController,
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.grey,
              onTap: onTap,
              tabs: tabList,
            ),
          ),
          pinned: true,
        );
}

class CustomTab extends Tab {
  final Widget customIcon;
  final String customText;

  const CustomTab({super.key, required this.customIcon, required this.customText})
      : super(
          icon: customIcon,
          text: customText,
          height: 80,
        );
}
