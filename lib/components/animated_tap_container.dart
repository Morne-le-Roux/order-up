import 'package:flutter/material.dart';

class AnimatedTapContainer extends StatefulWidget {
  const AnimatedTapContainer({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final void Function() onTap;

  @override
  State<AnimatedTapContainer> createState() => _AnimatedTapContainerState();
}

class _AnimatedTapContainerState extends State<AnimatedTapContainer> {
  bool _isAnimating = false;

  void _toggleAnimation() async {
    setState(() {
      _isAnimating = true;
    });

    if (_isAnimating) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() {
        _isAnimating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _toggleAnimation();
        widget.onTap();
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        width: _isAnimating ? 200 : 250.0,
        height: _isAnimating ? 200.0 : 250.0,
        duration: const Duration(milliseconds: 40),
        curve: Curves.easeInOut,
        child: widget.child,
      ),
    );
  }
}
