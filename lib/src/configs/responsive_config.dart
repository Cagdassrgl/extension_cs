/// Responsive tasarım için referans boyutları yöneten singleton sınıf
class ResponsiveConfig {
  static final ResponsiveConfig _instance = ResponsiveConfig._internal();

  factory ResponsiveConfig() => _instance;

  ResponsiveConfig._internal();

  double _referenceWidth = 390.0; // iPhone 12 Pro default
  double _referenceHeight = 844.0; // iPhone 12 Pro default

  /// Referans boyutları ayarla
  void setReferenceDimensions({required double width, required double height}) {
    _referenceWidth = width;
    _referenceHeight = height;
  }

  /// Mevcut referans genişliği al
  double get referenceWidth => _referenceWidth;

  /// Mevcut referans yüksekliği al
  double get referenceHeight => _referenceHeight;

  /// Popüler cihaz referansları
  static void setIPhone12Pro() {
    ResponsiveConfig().setReferenceDimensions(width: 390.0, height: 844.0);
  }

  static void setIPhone14Pro() {
    ResponsiveConfig().setReferenceDimensions(width: 393.0, height: 852.0);
  }

  static void setIPhoneSE() {
    ResponsiveConfig().setReferenceDimensions(width: 375.0, height: 667.0);
  }

  static void setGalaxyS21() {
    ResponsiveConfig().setReferenceDimensions(width: 384.0, height: 854.0);
  }

  static void setPixel5() {
    ResponsiveConfig().setReferenceDimensions(width: 393.0, height: 851.0);
  }

  static void setIPadAir() {
    ResponsiveConfig().setReferenceDimensions(width: 820.0, height: 1180.0);
  }

  /// Custom cihaz referansı ayarla
  static void setCustomReference({required double width, required double height}) {
    ResponsiveConfig().setReferenceDimensions(width: width, height: height);
  }
}
