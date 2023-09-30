import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomVisibilityWidget extends StatelessWidget {
  final bool visible;

  const CustomVisibilityWidget({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black.withOpacity(.6)),
        child: const CupertinoActivityIndicator(
          color: Colors.white,
          radius: 20,
        ),
      ),
    );
  }
}
