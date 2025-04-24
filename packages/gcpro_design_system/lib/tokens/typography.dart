import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

final kFontFamily = GoogleFonts.poppins().fontFamily;
final kFontFamilyFallback = !kIsWeb && (Platform.isIOS || Platform.isMacOS)
    ? null
    : <String>[GoogleFonts.notoColorEmoji().fontFamily!];

final kCodeStyle = TextStyle(
  fontFamily: GoogleFonts.sourceCodePro().fontFamily,
  fontFamilyFallback: kFontFamilyFallback,
);

const kTextStyleButton = TextStyle(fontWeight: FontWeight.bold);
const kTextStyleTab = TextStyle(fontSize: 14);
const kTextStyleButtonSmall = TextStyle(fontSize: 12);
const kFormDataButtonLabelTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  overflow: TextOverflow.ellipsis,
);
const kTextStylePopupMenuItem = TextStyle(fontSize: 14);

// Text Themes

final kTextStyleTitleLarge = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

final kTextStyleTitleMedium = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final kTextStyleTitleSmall = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

final kTextStyleBodyLarge = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
);

final kTextStyleBodyMedium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
);

final kTextStyleBodySmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.normal,
);

final kTextStyleLabelLarge = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

final kTextStyleLabelMedium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

final kTextStyleLabelSmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

final kTextStyleHeadlineLarge = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

final kTextStyleHeadlineMedium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

final kTextStyleHeadlineSmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

final kTextStyleDisplayLarge = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

final kTextStyleDisplayMedium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

final kTextStyleDisplaySmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
);
