import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  /// Mevcut temayı döner
  ThemeData get theme => Theme.of(this);

  /// Mevcut tema renklerini döner
  ColorScheme get colorScheme => theme.colorScheme;

  /// Mevcut metin temalarını döner
  TextTheme get textTheme => theme.textTheme;

  /// Mevcut input decoration temalarını döner
  InputDecorationThemeData get inputDecorationTheme => theme.inputDecorationTheme;

  /// Mevcut button temalarını döner
  ButtonThemeData get buttonTheme => theme.buttonTheme;

  /// Mevcut icon temalarını döner
  IconThemeData get iconTheme => theme.iconTheme;

  /// Mevcut app bar temalarını döner
  AppBarThemeData get appBarTheme => theme.appBarTheme;

  /// Mevcut floating action button temalarını döner
  FloatingActionButtonThemeData get floatingActionButtonTheme => theme.floatingActionButtonTheme;

  /// Mevcut accent renklerini döner
  Color get accentColor => theme.colorScheme.secondary;

  /// Mevcut primary renklerini döner
  Color get primaryColor => theme.primaryColor;

  /// Mevcut background renklerini döner
  Color get backgroundColor => theme.colorScheme.surface;

  /// Mevcut scaffold arka plan rengini döner
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  /// Mevcut card renklerini döner
  Color get cardColor => theme.cardColor;

  /// Mevcut error renklerini döner
  Color get errorColor => theme.colorScheme.error;
}
