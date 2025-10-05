## 0.0.1

### 🎉 İlk Sürüm

Flutter için kapsamlı extension paketi yayınlandı! Bu sürüm aşağıdaki özellikler içerir:

#### 🎨 Color Extensions
- `darken()` ve `lighten()` - Renkleri koyulaştırma/açıklaştırma
- `withReducedOpacity()` - Opacity azaltma
- `toHex()` ve `toRgb` - Renk formatı dönüşümleri
- `invert` - Ters renk alma
- `contrastColor` - Otomatik kontrast renk belirleme
- `withValues()` - Renk bileşenlerini özelleştirme

#### 📅 DateTime Extensions  
- `timeAgo()` - Zaman farkını Türkçe gösterme ("2 saat önce", "3 gün önce")
- `format()` - Özel tarih formatlaması
- `isSameDate()` - Tarih karşılaştırması
- `version` - Unix timestamp alma

#### 🧭 Navigator Extensions
- `push()`, `pushNamed()` - Basit sayfa geçişleri
- `pushReplacement()`, `pushAndClearStack()` - Gelişmiş navigasyon
- `pushWithFade()`, `pushWithSlide()` - Animasyonlu geçişler
- `showBottomModal()`, `showAlert()` - Modal pencere gösterme
- `pop()`, `maybePop()`, `canPop()` - Güvenli geri dönüş işlemleri

#### 📏 Size Extensions
- Ekran boyutu erişimi (`screenWidth`, `screenHeight`, `screenSize`)
- Cihaz tipi algılama (`isTablet`, `isPhone`, `isSmallPhone`, `isLargeTablet`)
- Yüzdelik boyutlandırma (`percentWidth()`, `percentHeight()`)
- Dinamik boyutlandırma (`dynamicWidth()`, `dynamicHeight()`)
- Responsive font boyutu (`dynamicFontSize()`, `adaptiveFontSize()`)
- Sınırlı boyutlandırma (`dynamicSizeWithLimits()`)

#### 🎭 Theme Extensions
- Tema erişimi (`theme`, `colorScheme`, `textTheme`)
- Renk kısayolları (`primaryColor`, `backgroundColor`, `errorColor`)
- Tema bileşenleri (`appBarTheme`, `buttonTheme`, `iconTheme`)

#### 🔧 Widget Extensions
- Layout wrapper'ları (`center`, `withPadding()`, `withMargin()`)
- Boyutlandırma (`withSize()`, `expanded()`, `flexible()`)
- Etkileşim (`onTap()`, `visible()`)
- Dekorasyon (`withDecoration()`, `withOpacity()`, `asCard()`)
- Konumlandırma (`positioned()`, `withAlignment()`)

#### ⚙️ Responsive Config
- Referans cihaz boyutları ayarlama
- Popüler cihaz presetleri (iPhone 12 Pro, Galaxy S21, iPad Air vb.)
- Özel referans boyutu belirleme
- Singleton pattern ile global erişim

### 📋 Teknik Detaylar
- Flutter 3.7.0+ desteği
- Null safety uyumlu
- Kapsamlı dökümantasyon
- Türkçe yorum ve açıklamalar
- Performance optimized extension'lar
