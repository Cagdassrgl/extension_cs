// ignore_for_file: avoid_print

import 'package:extension_cs/extension_cs.dart';
import 'package:flutter/material.dart';

void main() {
  // Color Extensions Test
  testColorExtensions();

  // DateTime Extensions Test
  testDateTimeExtensions();

  // Size Extensions Test (simulated)
  testSizeExtensions();
}

void testColorExtensions() {
  print('🌈 COLOR EXTENSIONS TEST');
  print('=' * 40);

  const testColor = Colors.blue;

  // Hex formatı testi
  print('Original color: ${testColor.toHex()}');
  print('RGB format: ${testColor.toRgb}');

  // Renk manipülasyonu testi
  final lighterColor = testColor.lighten(0.2);
  final darkerColor = testColor.darken(0.2);
  print('Lighter (20%): ${lighterColor.toHex()}');
  print('Darker (20%): ${darkerColor.toHex()}');

  // Opacity testi
  final reducedOpacity = testColor.withReducedOpacity(0.5);
  print('Reduced opacity: ${reducedOpacity.toHex()}');

  // Invert testi
  final inverted = testColor.invert;
  print('Inverted: ${inverted.toHex()}');

  // Contrast color testi
  final contrastColor = testColor.contrastColor;
  print('Contrast color: ${contrastColor == Colors.white ? "White" : "Black"}');

  print('');
}

void testDateTimeExtensions() {
  print('📅 DATETIME EXTENSIONS TEST');
  print('=' * 40);

  final now = DateTime.now();
  final pastDate = DateTime.now().subtract(const Duration(minutes: 30));
  // final futureDate = DateTime.now().add(const Duration(days: 2));

  // Format testi
  print('Current time: ${now.format('dd/MM/yyyy HH:mm:ss')}');
  print('Custom format: ${now.format('yyyy-MM-dd')}');

  // TimeAgo testi
  print('30 minutes ago: ${pastDate.timeAgo()}');

  // Version (timestamp) testi
  print('Timestamp: ${now.version}');

  // Same date testi
  final sameDate = DateTime(now.year, now.month, now.day, 10, 30);
  print('Is same date: ${now.isSameDate(sameDate)}');

  print('');
}

void testSizeExtensions() {
  print('📐 SIZE EXTENSIONS TEST');
  print('=' * 40);

  // ResponsiveConfig test
  ResponsiveConfig.setIPhone12Pro();
  print('Reference device: iPhone 12 Pro');
  print('Reference width: ${ResponsiveConfig().referenceWidth}');
  print('Reference height: ${ResponsiveConfig().referenceHeight}');

  ResponsiveConfig.setIPadAir();
  print('Changed to: iPad Air');
  print('New reference width: ${ResponsiveConfig().referenceWidth}');
  print('New reference height: ${ResponsiveConfig().referenceHeight}');

  print('');
}
