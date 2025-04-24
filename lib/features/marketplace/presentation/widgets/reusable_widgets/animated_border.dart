import 'package:gcpro_design_system/tokens/tokens.dart';
import 'package:flutter/material.dart';

/// A reusable widget that adds a continuous animated circular border around a child widget.
/// Ideal for avatars or icons to draw user attention with a subtle rotating arc.
class AnimatedAvatarBorder extends StatefulWidget {
  final Widget child;
  final double radius;
  final Color borderColor;
  final double borderWidth;
  final double drawArc;
  final Duration animationDuration;

  const AnimatedAvatarBorder({
    Key? key,
    required this.child,
    this.radius = 17.0,
    this.borderColor = kColorSchemeSeed,
    this.borderWidth = 1.5,
    this.drawArc = 3.1416 / 2,
    this.animationDuration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  _AnimatedAvatarBorderState createState() => _AnimatedAvatarBorderState();
}

class _AnimatedAvatarBorderState extends State<AnimatedAvatarBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat(); // Continuous rotation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _AnimatedBorderPainter(
        animation: _controller,
        borderColor: widget.borderColor,
        borderWidth: widget.borderWidth,
        drawArc: widget.drawArc,
      ),
      child: Container(
        padding: EdgeInsets.all(widget.borderWidth + 2), // Space for the border
        child: SizedBox(
          width: widget.radius * 2,
          height: widget.radius * 2,
          child: widget.child,
        ),
      ),
    );
  }
}

class _AnimatedBorderPainter extends CustomPainter {
  final Animation<double> animation;
  final Color borderColor;
  final double borderWidth;
  final double drawArc;

  _AnimatedBorderPainter({
    required this.animation,
    required this.borderColor,
    required this.borderWidth,
    required this.drawArc,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.25;

    // Draw a rotating arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      animation.value * 2 * 3.1416, // Rotate based on animation value
      drawArc, // Configurable arc length
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_AnimatedBorderPainter oldDelegate) =>
      oldDelegate.animation != animation ||
      oldDelegate.borderColor != borderColor ||
      oldDelegate.borderWidth != borderWidth ||
      oldDelegate.drawArc != drawArc;
}
