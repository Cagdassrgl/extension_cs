## Extension CS - Demo Uygulaması

Bu demo uygulaması, `extension_cs` paketindeki tüm extension'ları test edebilmeniz için oluşturulmuştur.

### Özellikler

#### 🧭 Navigator Extensions
- `context.push()` - Normal sayfa geçişi
- `context.pushReplacement()` - Sayfa değiştirme
- `context.pushWithFade()` - Fade animasyonu ile geçiş
- `context.pushWithSlide()` - Slide animasyonu ile geçiş
- `context.showBottomModal()` - Modal bottom sheet
- `context.showAlert()` - Alert dialog
- `context.pop()` - Geri dönüş
- `context.canPop()` - Geri dönüş kontrolü

#### 📐 Size Extensions
- `context.screenWidth/Height` - Ekran boyutları
- `context.dynamicWidth/Height()` - Responsive boyutlandırma
- `context.adaptiveFontSize()` - Cihaza uygun font boyutu
- `context.percentWidth/Height()` - Yüzdelik hesaplamalar
- `context.isTablet/Phone` - Cihaz tipi tespiti
- `ResponsiveConfig` - Referans cihaz ayarları

#### 🎨 Theme Extensions
- `context.theme` - Ana tema
- `context.colorScheme` - Renk şeması
- `context.textTheme` - Metin temaları
- `context.primaryColor` - Ana renk
- `context.backgroundColor` - Arka plan rengi

#### 📅 DateTime Extensions
- `dateTime.timeAgo()` - "X dakika önce" formatı
- `dateTime.format()` - Özel tarih formatı
- `dateTime.version` - Unix timestamp
- `dateTime.isSameDate()` - Tarih karşılaştırması

#### 🎁 Widget Extensions
- `widget.center` - Widget'i ortala
- `widget.withPadding()` - Padding ekle
- `widget.withMargin()` - Margin ekle
- `widget.withSize()` - Boyut ayarla
- `widget.expanded()` - Expanded ile sarma
- `widget.onTap()` - Tıklama olayı
- `widget.visible()` - Görünürlük kontrolü
- `widget.asCard()` - Card ile sarma

#### 🌈 Color Extensions
- `color.lighten()/darken()` - Renk açma/koyulaştırma
- `color.withReducedOpacity()` - Şeffaflık azaltma
- `color.invert` - Renk tersine çevirme
- `color.contrastColor` - Kontrast rengi
- `color.toHex()/toRgb` - Format dönüşümü

### Nasıl Kullanılır

1. Ana sayfadan test etmek istediğiniz extension kategorisini seçin
2. Her sayfada interaktif örnekler ve açıklamalar bulacaksınız
3. Kodu değiştirip hot reload ile değişiklikleri görebilirsiniz
4. Responsive özellikler için cihaz yönünü değiştirebilirsiniz

### Test Önerileri

- Size extension'ları için cihaz yönünü değiştirin
- Color extension'ları için farklı renkler seçin
- DateTime extension'ları için farklı tarihler seçin
- Widget extension'ları için interaktif örnekleri deneyin
- Navigator extension'ları ile sayfa geçişlerini test edin

### Geliştirme Notları

Bu demo uygulama extension_cs paketindeki tüm özellikleri kapsamaktadır ve gerçek projelerinizde nasıl kullanabileceğinizi gösterir.
