import 'package:flutter/material.dart';
import 'package:rpg_characters/models/character.dart';
import 'package:rpg_characters/theme.dart';

class Heart extends StatefulWidget {
  const Heart({super.key, required this.character});

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // Tween (between)
  late Animation _sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    // Animation Controller
    _animationController = AnimationController(
      duration: Duration(microseconds: 500),
      vsync: this,
    );

    // Size Animation
    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 40), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 40, end: 25), weight: 50),
    ]).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return IconButton(
          onPressed: () {
            _animationController.reset();
            _animationController.forward();
            widget.character.toggleIsFav();
          },
          icon: Icon(
            size: _sizeAnimation.value,
            Icons.favorite,
            color: widget.character.getIsFav
                ? AppColors.primaryAccent
                : Colors.grey[800],
          ),
        );
      },
    );
  }
}
