import 'package:flutter/material.dart';

final kColorTransparentState =
    WidgetStateProperty.all<Color>(Colors.transparent);
const kColorTransparent = Colors.transparent;
const kColorWhite = Colors.white;
const kColorWhite50 = Color.fromARGB(127, 255, 255, 255);
const kColorWhite25 = Color.fromARGB(65, 255, 255, 255);
const kColorBlack = Colors.black;
const kColorBlack50 = Color.fromARGB(127, 0, 0, 0);
const kColorBlack25 = Color.fromARGB(65, 0, 0, 0);
const kColorRed = Colors.red;
final kColorLightDanger = Colors.red.withValues(alpha: 0.9);
const kColorDarkDanger = Color(0xffcf6679);

const kColorSchemeSeed = Color.fromARGB(231, 5, 145, 232);
const kColorPrimary = Color.fromARGB(255, 110, 179, 6);
final kColorStatusCodeDefault = Colors.grey.shade700;
final kColorStatusCode200 = Colors.green.shade800;
final kColorStatusCode300 = Colors.blue.shade800;
final kColorStatusCode400 = Colors.red.shade800;
final kColorStatusCode500 = Colors.amber.shade900;

final kColorHttpMethodGet = Colors.green.shade800;
final kColorHttpMethodHead = kColorHttpMethodGet;
final kColorHttpMethodPost = Colors.blue.shade800;
final kColorHttpMethodPut = Colors.amber.shade900;
final kColorHttpMethodPatch = kColorHttpMethodPut;
final kColorHttpMethodDelete = Colors.red.shade800;

final kColorGQL = Colors.pink.shade600;

const kHintOpacity = 0.6;
const kForegroundOpacity = 0.05;
const kOverlayBackgroundOpacity = 0.5;
const kOpacityDarkModeBlend = 0.4;
