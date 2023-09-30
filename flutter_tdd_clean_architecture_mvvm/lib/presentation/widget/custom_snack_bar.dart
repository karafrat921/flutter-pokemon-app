import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  final Function()? onTap;
  final String message;
  final Color color;

  CustomSnackBar({
    super.key,
    required this.onTap,
    required this.message,
    required this.color,
  }) : super(
          content: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 10,
            shadowColor: color,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 80,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: Text(
                  message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        );
}
