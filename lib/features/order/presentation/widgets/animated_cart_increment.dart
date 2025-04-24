import 'package:gcpro_design_system/tokens/tokens.dart';
import 'package:flutter/material.dart';

class AnimatedIncrementButton extends StatefulWidget {
  const AnimatedIncrementButton({
    required this.onTap,
    required this.onLongPress,
    required this.icon,
    super.key,
  });

  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final IconData icon;
  @override
  State<AnimatedIncrementButton> createState() =>
      _AnimatedIncrementButtonState();
}

class _AnimatedIncrementButtonState extends State<AnimatedIncrementButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.9,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward().then((_) => _controller.reverse());
    widget.onTap();
  }

  void _handleLongPress() {
    _controller.forward().then((_) => _controller.reverse());
    widget.onLongPress();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _handleLongPress,
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _controller,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: kP8,
            child: Icon(
              widget.icon,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
