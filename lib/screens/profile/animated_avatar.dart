import 'package:flutter/material.dart';
import 'package:royalbattle/screens/profile/constants.dart';

class AnimatedAvatar extends StatefulWidget {
  const AnimatedAvatar({super.key});

  @override
  State<AnimatedAvatar> createState() => _AnimatedAvatarState();
}

class _AnimatedAvatarState extends State<AnimatedAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Animated Gold Ring
        RotationTransition(
          turns: _controller,
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  kPrimaryColor.withOpacity(0.8),
                  kPrimaryColor.withOpacity(0.2),
                  kPrimaryColor.withOpacity(0.8),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[400], // Placeholder for avatar
              ),
              child: const Icon(Icons.person, size: 80, color: kTextColor),
            ),
          ),
        ),
        // Change Photo Button
        Positioned(
          bottom: 10,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.camera_alt, size: 16),
            label: const Text('Change Photo'),
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.black,
              elevation: 5,
              shadowColor: kPrimaryColor.withOpacity(0.5),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
