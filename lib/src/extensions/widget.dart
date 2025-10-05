import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget get center => Center(child: this);

  /// Widget'i belirli bir padding ile sarmalar
  Widget withPadding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  /// Widget'i belirli bir margin ile sarmalar
  Widget withMargin(EdgeInsetsGeometry margin) {
    return Container(margin: margin, child: this);
  }

  /// Widget'i belirli bir alignment ile sarmalar
  Widget withAlignment(Alignment alignment) {
    return Align(alignment: alignment, child: this);
  }

  /// Widget'i Positioned ile sarmalar ve belirli konumlandırma değerlerini ayarlar
  Widget positioned({double? top, double? bottom, double? left, double? right, double? width, double? height}) {
    return Positioned(top: top, bottom: bottom, left: left, right: right, width: width, height: height, child: this);
  }

  /// Widget'i belirli bir genişlik ve yükseklik ile sarmalar
  Widget withSize({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: this);
  }

  /// Widget'i belirli bir dekorasyon ile sarmalar
  Widget withDecoration(BoxDecoration decoration) {
    return Container(decoration: decoration, child: this);
  }

  /// Widget'i belirli bir opacity ile sarmalar
  Widget withOpacity(double opacity) {
    return Opacity(opacity: opacity, child: this);
  }

  /// Widget'i Expanded ile sarmalar
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  /// Widget'i Flexible ile sarmalar
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) => Flexible(flex: flex, fit: fit, child: this);

  /// Widget'i GestureDetector ile sarmalar ve onTap olayını ekler
  Widget onTap(VoidCallback onTap, {HitTestBehavior behavior = HitTestBehavior.opaque}) {
    return GestureDetector(onTap: onTap, behavior: behavior, child: this);
  }

  /// Widget'i Visibility ile sarmalar ve görünürlüğünü ayarlar
  Widget visible(bool isVisible, {Widget replacement = const SizedBox.shrink()}) {
    return Visibility(visible: isVisible, replacement: replacement, child: this);
  }

  /// Widget'i Card ile sarmalar ve belirli bir elevation ve shape uygular
  Widget asCard({double elevation = 1.0, ShapeBorder? shape, Color? color, EdgeInsetsGeometry? margin}) {
    return Card(elevation: elevation, shape: shape, color: color, margin: margin, child: this);
  }
}
