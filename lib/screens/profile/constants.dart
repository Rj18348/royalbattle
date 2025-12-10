import 'package:flutter/material.dart';

// Colors
const Color kPrimaryColor = Color(0xFFF9C623); // Gold
const Color kSecondaryColor = Color(0xFF001122); // Dark Navy
const Color kBackgroundColor = Colors.black;
const Color kTextColor = Colors.white;
const Color kSubtleTextColor = Color(0xFFCCCCCC);
const Color kErrorColor = Colors.red;
const Color kSuccessColor = Colors.green;
const Color kWarningColor = Colors.yellow;
const Color kFacebookColor = Color(0xFF1877F2);
const Color kGoogleColor = Color(0xFFDB4437);
const Color kWhatsappColor = Color(0xFF25D366);

// Text Styles
const TextStyle kAppBarTitleStyle = TextStyle(
  color: kTextColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const TextStyle kProfileNameStyle = TextStyle(
  color: kTextColor,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle kProfileIgnStyle = TextStyle(
  color: kSubtleTextColor,
  fontSize: 16,
);

const TextStyle kProfileIdStyle = TextStyle(
  color: kSubtleTextColor,
  fontSize: 14,
);

const TextStyle kSectionTitleStyle = TextStyle(
  color: kTextColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const TextStyle kCardTitleStyle = TextStyle(
  color: kTextColor,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const TextStyle kCardSubtitleStyle = TextStyle(
  color: kSubtleTextColor,
  fontSize: 12,
);

const TextStyle kStatsNumberStyle = TextStyle(
  color: kTextColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const TextStyle kStatsTextStyle = TextStyle(
  color: kSubtleTextColor,
  fontSize: 12,
);

// Decorations
BoxDecoration kCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  border: Border.all(color: kPrimaryColor, width: 2),
  boxShadow: [
    BoxShadow(
      color: kPrimaryColor.withValues(alpha: 0.3),
      blurRadius: 20,
      spreadRadius: 5,
      offset: const Offset(0, 5),
    ),
  ],
  gradient: LinearGradient(
    colors: [
      kTextColor.withValues(alpha: 0.1),
      kTextColor.withValues(alpha: 0.05),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);
