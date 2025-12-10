import 'package:flutter/material.dart';
import 'package:royalbattle/profile/constants.dart';
import 'package:royalbattle/profile/social_login_button.dart';

class SocialConnectSection extends StatelessWidget {
  const SocialConnectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Connect Account', style: kSectionTitleStyle),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialLoginButton(
              icon: Icons.g_mobiledata,
              label: 'Google',
              backgroundColor: kGoogleColor,
              onPressed: () {},
            ),
            SocialLoginButton(
              icon: Icons.facebook,
              label: 'Facebook',
              backgroundColor: kFacebookColor,
              onPressed: () {},
            ),
            SocialLoginButton(
              icon: Icons.phone_android,
              label: 'Phone OTP',
              backgroundColor: kWhatsappColor,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
