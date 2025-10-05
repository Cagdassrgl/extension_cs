# Extension CS

[![pub package](https://img.shields.io/pub/v/extension_cs.svg)](https://pub.dev/packages/extension_cs)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Flutter için geliştirilmiş kapsamlı extension paketi. Bu paket, Flutter uygulamalarınızda daha hızlı ve temiz kod yazmanızı sağlayan çeşitli extension'lar içerir.

## Özellikler

- 🎨 **Color Extensions**: Renk manipülasyonu ve dönüşümü
- 📅 **DateTime Extensions**: Tarih formatlaması ve zaman hesaplamaları  
- 🧭 **Navigator Extensions**: Sayfa geçişleri ve navigasyon işlemleri
- 📏 **Size Extensions**: Responsive tasarım ve boyutlandırma
- 🎭 **Theme Extensions**: Tema erişimi ve renk yönetimi
- 🔧 **Widget Extensions**: Widget modifikasyonu ve wrapper'ları
- ⚙️ **Responsive Config**: Dinamik boyutlandırma konfigürasyonu

## Kurulum

```yaml
dependencies:
  extension_cs: ^0.0.1
```

```bash
flutter pub get
```

## Kullanım

```dart
import 'package:extension_cs/extension_cs.dart';
```

## Extension'lar

### 🎨 Color Extensions

Renk manipülasyonu için gelişmiş özellikler:

```dart
Color color = Colors.blue;

// Rengi koyulaştır/açıklaştır
Color darkerBlue = color.darken(0.2);
Color lighterBlue = color.lighten(0.3);

// Opacity ayarları
Color transparentBlue = color.withReducedOpacity(0.5);

// Renk dönüşümleri
String hexColor = color.toHex(); // #FF2196F3
String rgbColor = color.toRgb;   // rgb(33, 150, 243)

// Renk analizi
Color contrastColor = color.contrastColor; // Otomatik siyah/beyaz
Color invertedColor = color.invert;        // Ters renk

// Renk bileşenlerini değiştir
Color newColor = color.withValues(red: 255, alpha: 0.8);
```

### 📅 DateTime Extensions

Tarih ve zaman işlemleri için yardımcı metodlar:

```dart
DateTime now = DateTime.now();
DateTime pastDate = DateTime(2023, 1, 15);

// Zaman farkını göster
String timeAgo = pastDate.timeAgo(); // "2 saat önce", "3 gün önce" vb.

// Tarih formatlaması
String formatted = now.format('dd/MM/yyyy HH:mm'); // "05/10/2025 14:30"

// Tarih karşılaştırması
bool sameDay = now.isSameDate(pastDate);

// Unix timestamp
int timestamp = now.version; // Milliseconds since epoch
```

### 🧭 Navigator Extensions

Sayfa geçişleri ve navigasyon işlemlerini basitleştirin:

```dart
// Temel navigasyon
context.push(NewPage());
context.pushNamed('/settings');
context.pop();

// Gelişmiş navigasyon
context.pushReplacement(HomePage());
context.pushAndClearStack(LoginPage());
context.pushNamedAndClearStack('/login');

// Animasyonlu geçişler
context.pushWithFade(ProfilePage());
context.pushWithSlide(SettingsPage(), begin: Offset(1.0, 0.0));

// Modal işlemleri
context.showBottomModal(MyBottomSheet());
context.showAlert(MyDialog());

// Güvenli navigasyon
if (context.canPop()) {
  context.pop();
}
context.maybePop(); // Güvenli geri dönüş
```

### 📏 Size Extensions

Responsive tasarım ve dinamik boyutlandırma:

```dart
// Ekran bilgileri
double width = context.screenWidth;
double height = context.screenHeight;
Size screenSize = context.screenSize;
bool isTablet = context.isTablet;
bool isPhone = context.isPhone;

// Yüzdelik boyutlar
double halfWidth = context.percentWidth(50);    // Ekranın %50'si
double quarterHeight = context.percentHeight(25); // Yüksekliğin %25'i

// Dinamik boyutlandırma
double dynamicWidth = context.dynamicWidth(100);  // Responsive genişlik
double dynamicHeight = context.dynamicHeight(50); // Responsive yükseklik
double dynamicFont = context.dynamicFontSize(16); // Responsive font

// Cihaz tipine göre font boyutu
double adaptiveFont = context.adaptiveFontSize(14);

// Sınırlı boyutlandırma
double limitedSize = context.dynamicSizeWithLimits(
  24, 
  minSize: 16, 
  maxSize: 32
);
```

### 🎭 Theme Extensions

Tema ve renk erişimini kolaylaştırın:

```dart
// Tema erişimi
ThemeData theme = context.theme;
ColorScheme colors = context.colorScheme;
TextTheme textTheme = context.textTheme;

// Renk kısayolları
Color primary = context.primaryColor;
Color accent = context.accentColor;
Color background = context.backgroundColor;
Color error = context.errorColor;

// Tema bileşenleri
AppBarThemeData appBarTheme = context.appBarTheme;
ButtonThemeData buttonTheme = context.buttonTheme;
IconThemeData iconTheme = context.iconTheme;
```

### 🔧 Widget Extensions

Widget'ları kolayca modifiye edin:

```dart
Widget myWidget = Text('Merhaba');

// Layout modifikasyonları
Widget centeredWidget = myWidget.center;
Widget paddedWidget = myWidget.withPadding(EdgeInsets.all(16));
Widget marginWidget = myWidget.withMargin(EdgeInsets.all(8));
Widget sizedWidget = myWidget.withSize(width: 200, height: 100);

// Flex layout
Widget expandedWidget = myWidget.expanded(flex: 2);
Widget flexibleWidget = myWidget.flexible();

// Etkileşim
Widget tappableWidget = myWidget.onTap(() => print('Tapped!'));

// Görünürlük
Widget conditionalWidget = myWidget.visible(shouldShow);

// Dekorasyon
Widget decoratedWidget = myWidget.withDecoration(
  BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
);

// Opacity
Widget transparentWidget = myWidget.withOpacity(0.5);

// Card wrapper
Widget cardWidget = myWidget.asCard(elevation: 4);

// Positioning (Stack içinde kullanın)
Widget positionedWidget = myWidget.positioned(
  top: 20,
  left: 10,
  width: 100,
  height: 50,
);
```

### ⚙️ Responsive Config

Dinamik boyutlandırma için referans değerleri ayarlayın:

```dart
// Varsayılan cihazlar
ResponsiveConfig.setIPhone12Pro();  // 390x844
ResponsiveConfig.setIPhone14Pro();  // 393x852
ResponsiveConfig.setGalaxyS21();    // 384x854
ResponsiveConfig.setIPadAir();      // 820x1180

// Özel referans boyutu
ResponsiveConfig.setCustomReference(
  width: 375, 
  height: 812
);

// Manuel konfigürasyon
ResponsiveConfig().setReferenceDimensions(
  width: 390,
  height: 844,
);
```

## Örnek Kullanım

```dart
import 'package:flutter/material.dart';
import 'package:extension_cs/extension_cs.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        title: Text('Extension CS Demo'),
        backgroundColor: Colors.blue.lighten(0.2),
      ),
      body: Column(
        children: [
          // Responsive Container
          Container(
            width: context.percentWidth(90),
            height: context.dynamicHeight(100),
            decoration: BoxDecoration(
              color: Colors.blue.withReducedOpacity(0.3),
              borderRadius: BorderRadius.circular(
                context.dynamicWidth(12),
              ),
            ),
          ).withPadding(EdgeInsets.all(
            context.dynamicWidth(16),
          )),
          
          // Responsive Text
          Text(
            'Responsive Text',
            style: context.textTheme.headlineMedium?.copyWith(
              fontSize: context.adaptiveFontSize(24),
              color: context.primaryColor,
            ),
          ).center.onTap(() {
            context.push(NextPage());
          }),
          
          // Time Display
          Text(
            DateTime.now().format('dd/MM/yyyy HH:mm'),
            style: TextStyle(
              fontSize: context.dynamicFontSize(16),
              color: Colors.grey.darken(0.3),
            ),
          ),
        ],
      ).withPadding(EdgeInsets.all(
        context.dynamicWidth(20),
      )),
    );
  }
}
```

## Katkıda Bulunma

Katkılarınızı bekliyoruz! Lütfen önce bir issue açın ve değişikliklerinizi tartışın.

1. Fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit yapın (`git commit -m 'Add some amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request açın

## Lisans

Bu proje MIT lisansı altında yayınlanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## Yazar

**Çağdaş Sarıgil** - [GitHub](https://github.com/Cagdassrgl)

---

⭐ Bu paketi beğendiyseniz yıldız vermeyi unutmayın!