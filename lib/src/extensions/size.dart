import 'package:flutter/material.dart';

import '../configs/responsive_config.dart';

extension SizeExtension on BuildContext {
  /// Ekran genişliğini döner
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Ekran yüksekliğini döner
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Ekran boyutlarını döner
  Size get screenSize => MediaQuery.of(this).size;

  /// Ekran padding değerlerini döner
  EdgeInsets get screenPadding => MediaQuery.of(this).padding;

  /// Ekran viewInsets değerlerini döner (örneğin klavye yüksekliği)
  EdgeInsets get screenViewInsets => MediaQuery.of(this).viewInsets;

  /// Ekran orientation değerini döner
  Orientation get screenOrientation => MediaQuery.of(this).orientation;

  /// Ekran pixel ratio değerini döner
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Ekran text scale factor değerini döner
  TextScaler get textScale => MediaQuery.of(this).textScaler;

  double get shortestSide => screenSize.shortestSide;

  double get longestSide => screenSize.longestSide;

  bool get isPortrait => screenOrientation == Orientation.portrait;

  bool get isLandscape => screenOrientation == Orientation.landscape;

  bool get isTablet => shortestSide >= 600;

  bool get isPhone => !isTablet;

  bool get isSmallPhone => isPhone && shortestSide < 360;

  bool get isLargeTablet => isTablet && shortestSide >= 720;

  double percentWidth(double percent) => screenWidth * percent / 100;

  double percentHeight(double percent) => screenHeight * percent / 100;

  double percentShortestSide(double percent) => shortestSide * percent / 100;

  double percentLongestSide(double percent) => longestSide * percent / 100;

  double percentArea(double percent) => (screenWidth * screenHeight) * percent / 100;

  /// Dinamik genişlik - cihaz genişliğine göre ölçeklenir
  /// [width] Referans genişlik değeri
  double dynamicWidth(double width) {
    final config = ResponsiveConfig();
    final scale = screenWidth / config.referenceWidth;
    return width * scale;
  }

  /// Dinamik yükseklik - cihaz yüksekliğine göre ölçeklenir
  /// [height] Referans yükseklik değeri
  double dynamicHeight(double height) {
    final config = ResponsiveConfig();
    final scale = screenHeight / config.referenceHeight;
    return height * scale;
  }

  /// Dinamik font boyutu - cihaz boyutuna göre ölçeklenir
  /// [fontSize] Referans font boyutu
  double dynamicFontSize(double fontSize) {
    final config = ResponsiveConfig();
    // En kısa kenarı baz alarak daha tutarlı sonuçlar alırız
    final referenceShortestSide =
        config.referenceWidth < config.referenceHeight ? config.referenceWidth : config.referenceHeight;

    final scale = shortestSide / referenceShortestSide;

    // Minimum ve maksimum sınırlar
    const minScale = 0.7;
    const maxScale = 1.4;

    final clampedScale = scale.clamp(minScale, maxScale);

    // Text scale factor'ü de dahil edelim
    return fontSize * clampedScale;
  }

  /// Cihaz tipi bazlı dinamik font boyutu
  /// [baseFontSize] Temel font boyutu
  double adaptiveFontSize(double baseFontSize) {
    if (isSmallPhone) {
      return baseFontSize * 0.85;
    } else if (isTablet) {
      return baseFontSize * 1.2;
    } else if (isLargeTablet) {
      return baseFontSize * 1.4;
    }
    return baseFontSize;
  }

  /// Responsive boyut - hem genişlik hem yükseklik için ortalama ölçek
  /// [size] Referans boyut değeri
  double responsiveSize(double size) {
    final config = ResponsiveConfig();
    final widthScale = screenWidth / config.referenceWidth;
    final heightScale = screenHeight / config.referenceHeight;
    final averageScale = (widthScale + heightScale) / 2;

    return size * averageScale;
  }

  /// Minimum boyut kontrolü ile dinamik boyut
  /// [size] Referans boyut
  /// [minSize] Minimum boyut sınırı
  /// [maxSize] Maksimum boyut sınırı
  double dynamicSizeWithLimits(double size, {double? minSize, double? maxSize}) {
    final dynamicSize = responsiveSize(size);

    if (minSize != null && dynamicSize < minSize) {
      return minSize;
    }

    if (maxSize != null && dynamicSize > maxSize) {
      return maxSize;
    }

    return dynamicSize;
  }
}
