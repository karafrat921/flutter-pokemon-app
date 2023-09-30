import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Function() onPressed;
  final String title;

  const CustomFloatingActionButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        primary: Theme.of(context).primaryColor,
      ),
      child: Text(title),
    );
  }
}
