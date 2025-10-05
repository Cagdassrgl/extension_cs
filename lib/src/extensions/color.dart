// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color withOpacity(double opacity) {
    assert(opacity >= 0 && opacity <= 1, 'Opacity must be between 0 and 1');
    return withValues(alpha: opacity);
  }

  /// Renkten opaklık değeri çıkarır ve yeni bir renk döner
  Color withReducedOpacity(double amount) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    return withValues(alpha: (1 - amount).clamp(0.0, 1.0));
  }

  /// Rengi daha koyu yapar
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Rengi daha açık yapar
  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  /// Renk bileşenlerini belirli değerlerle değiştirir
  Color withValues({int? red, int? green, int? blue, double? alpha}) {
    return Color.fromARGB(
      (alpha != null ? (alpha * 255).clamp(0, 255).toInt() : a).toInt(),
      (red ?? r).toInt(),
      (green ?? g).toInt(),
      (blue ?? b).toInt(),
    );
  }

  /// Rengin hexadecimal string temsilini döner
  String toHex({bool leadingHashSign = true}) {
    return '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
  }

  /// Renk bileşenlerini tersine çevirir
  /// Örnek: Color(0xFF000000).invert() => Color(0xFFFFFFFF)
  Color get invert {
    return Color.fromARGB(a.toInt(), (255 - r).toInt(), (255 - g).toInt(), (255 - b).toInt());
  }

  /// Rengin kontrast rengini döner (siyah veya beyaz)
  Color get contrastColor {
    final luminance = (0.299 * r + 0.587 * g + 0.114 * b) / 255; // Yüksek kontrast için luminance hesaplama
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  /// Rengin RGB string temsilini döner
  /// Örnek: Color(0xFF123456).toRgb() => 'rgb(18, 52, 86)'
  String get toRgb {
    return 'rgb($r, $g, $b)';
  }
}
