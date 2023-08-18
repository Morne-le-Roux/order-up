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
        padding: EdgeInsets.all(_isAnimating
            ? 30 //INCREASE THIS TO MAKE THE ANIMATION MORE... MORE.
            : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: _isAnimating
          //     ? const Color.fromARGB(36, 207, 41, 97)
          //     : Colors.transparent,
        ),
        // width: _isAnimating ? 200.0 : 100.0,
        // height: _isAnimating ? 200.0 : 100.0,
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeInOut,
        child: widget.child,
      ),
    );
  }
}
