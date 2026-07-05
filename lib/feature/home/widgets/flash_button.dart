
import 'package:flutter/material.dart';

class FlashButton extends StatefulWidget {
  final Widget child;

  const FlashButton({super.key, required this.child});

  @override
  State<FlashButton> createState() => _FlashButtonState();
}

class _FlashButtonState extends State<FlashButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _controller.forward(from: 0);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            widget.child,

            AnimatedBuilder(
              animation: _controller,
              builder: (ctx, _) {
                return Positioned.fill(
                  child: Transform.translate(
                    offset: Offset(
                      (_controller.value * 300) - 150,
                      0,
                    ),
                    child: Transform.rotate(
                      angle: -0.4,
                      child: Container(
                        width: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.white.withAlpha(45),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}