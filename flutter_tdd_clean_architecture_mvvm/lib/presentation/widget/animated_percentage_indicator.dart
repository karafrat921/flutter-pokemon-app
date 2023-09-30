import 'package:flutter/material.dart';

import 'percentage_painter.dart';

class AnimatedPercentageIndicator extends StatefulWidget {
  final double percent;
  final double radius;
  final String txt;

  const AnimatedPercentageIndicator({
    super.key,
    required this.txt,
    required this.percent,
    this.radius = 150,
  });

  @override
  State<AnimatedPercentageIndicator> createState() => _AnimatedPercentageIndicatorState();
}

class _AnimatedPercentageIndicatorState extends State<AnimatedPercentageIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.percent,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.radius * 2, widget.radius * 2),
          painter: PercentagePainter(percent: _animation.value),
          child: Center(
            child: Text(
              "${(_animation.value * 100).toInt()} ${widget.txt}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
