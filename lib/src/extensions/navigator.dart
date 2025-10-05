import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  /// Yeni bir sayfaya geçiş yapar
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => page));
  }

  /// İsimlendirilmiş route ile yeni sayfaya geçiş yapar
  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  /// Mevcut sayfayı değiştirir (geri tuşu ile önceki sayfaya dönemez)
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(Widget page, {TO? result}) {
    return Navigator.of(this).pushReplacement<T, TO>(MaterialPageRoute(builder: (_) => page), result: result);
  }

  /// İsimlendirilmiş route ile mevcut sayfayı değiştirir
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    Object? arguments,
    TO? result,
  }) {
    return Navigator.of(this).pushReplacementNamed<T, TO>(routeName, arguments: arguments, result: result);
  }

  /// Tüm geçmişi temizleyip yeni sayfaya geçer
  Future<T?> pushAndClearStack<T extends Object?>(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil<T>(MaterialPageRoute(builder: (_) => page), (route) => false);
  }

  /// İsimlendirilmiş route ile tüm geçmişi temizleyip yeni sayfaya geçer
  Future<T?> pushNamedAndClearStack<T extends Object?>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(routeName, (route) => false, arguments: arguments);
  }

  /// Bir önceki sayfaya geri döner
  void pop<T extends Object?>([T? result]) {
    return Navigator.of(this).pop<T>(result);
  }

  /// Geri dönülebilir sayfa var mı kontrol eder
  bool canPop() {
    return Navigator.of(this).canPop();
  }

  /// Güvenli geri dönüş - eğer geri dönülebilir sayfa varsa geri döner
  Future<bool> maybePop<T extends Object?>([T? result]) {
    return Navigator.of(this).maybePop<T>(result);
  }

  /// Belirli bir sayfaya kadar geri döner
  void popUntil(String routeName) {
    return Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  /// Belirli bir sayfaya kadar olan tüm sayfaları kaldırır
  void popUntilPredicate(bool Function(Route<dynamic>) predicate) {
    return Navigator.of(this).popUntil(predicate);
  }

  /// Modal (dialog, bottom sheet vb.) kapatır
  void closeModal<T extends Object?>([T? result]) {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop<T>(result);
    }
  }

  /// Fade animasyonu ile sayfa geçişi
  Future<T?> pushWithFade<T extends Object?>(Widget page, {Duration? duration}) {
    return Navigator.of(this).push<T>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: duration ?? const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  /// Slide animasyonu ile sayfa geçişi
  Future<T?> pushWithSlide<T extends Object?>(Widget page, {Duration? duration, Offset? begin}) {
    return Navigator.of(this).push<T>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: duration ?? const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const end = Offset.zero;
          final tween = Tween(begin: begin ?? const Offset(1.0, 0.0), end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  /// Modal bottom sheet gösterir
  Future<T?> showBottomModal<T>(Widget child, {bool isScrollControlled = false}) {
    return showModalBottomSheet<T>(context: this, isScrollControlled: isScrollControlled, builder: (_) => child);
  }

  /// Alert dialog gösterir
  Future<T?> showAlert<T>(Widget dialog) {
    return showDialog<T>(context: this, builder: (_) => dialog);
  }
}
