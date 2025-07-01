import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FloatingAnimation extends StatefulWidget {
  final Widget child;
  const FloatingAnimation({super.key, required this.child});

  @override
  State<FloatingAnimation> createState() => _FloatingAnimationState();
}

class _FloatingAnimationState extends State<FloatingAnimation>
    with SingleTickerProviderStateMixin {
  bool up = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(
          vsync: this,
          duration: const Duration(seconds: 3),
          reverseDuration: const Duration(milliseconds: 2300),
        )..addStatusListener((AnimationStatus status) {
          if (status == AnimationStatus.completed) controller.reverse();
          if (status == AnimationStatus.dismissed) controller.forward();
        });

    controller.forward();
  }

  @override
  void dispose() {
    // Dispose of the AnimationController
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 250,

        width: double.infinity,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: const Offset(0, 0.24),
          ).animate(controller),
          child: widget.child,
        ),
      ),
    );
  }
}
