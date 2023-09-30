import 'package:flutter/material.dart';

class CustomGridDelegate extends SliverGridDelegateWithFixedCrossAxisCount {
  CustomGridDelegate()
      : super(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.2,
        );
}
