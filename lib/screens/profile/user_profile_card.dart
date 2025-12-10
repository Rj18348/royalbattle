import 'package:flutter/material.dart';
import 'package:royalbattle/screens/profile/constants.dart';
import 'package:royalbattle/screens/profile/animated_avatar.dart';

import 'social_connect_section.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: kCardDecoration,
      child: Column(
        children: [
          // Avatar Section
          const AnimatedAvatar(),
          const SizedBox(height: 20),
          // User Details
          const Column(
            children: [
              // Username
              Text('RoyalWarrior', style: kProfileNameStyle),
              SizedBox(height: 8),
              // Free Fire IGN
              Text('IGN: ShadowHunter_PRO', style: kProfileIgnStyle),
              SizedBox(height: 8),
              // User ID
              Text('User ID: 123456789', style: kProfileIdStyle),
              SizedBox(height: 12),
              // Rank Badge
              // ... (This can be a separate widget too)
            ],
          ),
          const SizedBox(height: 20),
          const SocialConnectSection(),
        ],
      ),
    );
  }
}
