import 'package:flutter/material.dart';
import 'package:royalbattle/screens/profile/constants.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32, top: 8, left: 16, right: 16),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 800),
        curve: Curves.elasticOut,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kPrimaryColor, width: 3),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(139, 0, 0, 0.5),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(249, 198, 35, 0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ), // This can be kPrimaryColor.withOpacity(0.2)
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        backgroundColor: kSecondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                            color: kPrimaryColor,
                            width: 2,
                          ),
                        ),
                        title: const Text(
                          'Confirm Logout',
                          style: kSectionTitleStyle,
                        ),
                        content: const Text(
                          'Are you sure you want to logout?',
                          style: kProfileIgnStyle,
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: kTextColor),
                            ),
                            onPressed: () => Navigator.of(dialogContext).pop(),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kErrorColor,
                              foregroundColor: kTextColor,
                            ),
                            child: const Text('Logout'),
                            onPressed: () {
                              Navigator.of(dialogContext).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Logging out...')),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B0000),
                  foregroundColor: kTextColor,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  elevation: 8,
                  shadowColor: const Color.fromRGBO(139, 0, 0, 0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.power_settings_new,
                      color: kPrimaryColor,
                      size: 24,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.exit_to_app, color: kPrimaryColor, size: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
