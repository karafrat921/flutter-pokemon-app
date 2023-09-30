import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String title;
  final String description;
  final Function() onTap;

  const CustomErrorWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 80,
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12)),
            child:  Text(
             description,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
