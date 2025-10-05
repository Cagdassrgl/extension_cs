import 'package:extension_cs/extension_cs.dart';
import 'package:flutter/material.dart';

class SizeExtensionPage extends StatefulWidget {
  const SizeExtensionPage({super.key});

  @override
  State<SizeExtensionPage> createState() => _SizeExtensionPageState();
}

class _SizeExtensionPageState extends State<SizeExtensionPage> {
  String selectedReferenceDevice = 'iPhone 12 Pro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size Extensions'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildDeviceSelector(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildScreenInfoCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildDeviceTypeCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildPercentageCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildDynamicSizingCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildResponsiveDemoCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Size Extensions',
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: context.dynamicHeight(8)),
            Text(
              'Ekran boyutları, responsive tasarım ve dinamik boyutlandırma için kullanışlı extension\'lar.',
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceSelector(BuildContext context) {
    final devices = {
      'iPhone SE': () => ResponsiveConfig.setIPhoneSE(),
      'iPhone 12 Pro': () => ResponsiveConfig.setIPhone12Pro(),
      'iPhone 14 Pro': () => ResponsiveConfig.setIPhone14Pro(),
      'Galaxy S21': () => ResponsiveConfig.setGalaxyS21(),
      'Pixel 5': () => ResponsiveConfig.setPixel5(),
      'iPad Air': () => ResponsiveConfig.setIPadAir(),
    };

    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Referans Cihaz Seçimi', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            DropdownButton<String>(
              value: selectedReferenceDevice,
              isExpanded: true,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedReferenceDevice = newValue;
                    devices[newValue]?.call();
                  });
                }
              },
              items: devices.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value));
              }).toList(),
            ),
            SizedBox(height: context.dynamicHeight(8)),
            Text(
              'Referans cihazı değiştirerek dinamik boyutlandırmanın nasıl çalıştığını görebilirsiniz.',
              style: context.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenInfoCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ekran Bilgileri', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            _buildInfoRow('Genişlik', '${context.screenWidth.toStringAsFixed(1)} px'),
            _buildInfoRow('Yükseklik', '${context.screenHeight.toStringAsFixed(1)} px'),
            _buildInfoRow('En Kısa Kenar', '${context.shortestSide.toStringAsFixed(1)} px'),
            _buildInfoRow('En Uzun Kenar', '${context.longestSide.toStringAsFixed(1)} px'),
            _buildInfoRow('Yönelim', context.isPortrait ? 'Dikey' : 'Yatay'),
            _buildInfoRow('Pixel Ratio', context.devicePixelRatio.toStringAsFixed(2)),
            _buildInfoRow('Text Scale', context.textScale.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceTypeCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cihaz Tipi Tespiti', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Row(
              children: [
                _buildDeviceTypeChip('Telefon', context.isPhone),
                SizedBox(width: context.dynamicWidth(8)),
                _buildDeviceTypeChip('Tablet', context.isTablet),
              ],
            ),
            SizedBox(height: context.dynamicHeight(8)),
            Row(
              children: [
                _buildDeviceTypeChip('Küçük Telefon', context.isSmallPhone),
                SizedBox(width: context.dynamicWidth(8)),
                _buildDeviceTypeChip('Büyük Tablet', context.isLargeTablet),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPercentageCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Yüzdelik Hesaplamalar', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            _buildInfoRow('50% Genişlik', '${context.percentWidth(50).toStringAsFixed(1)} px'),
            _buildInfoRow('30% Yükseklik', '${context.percentHeight(30).toStringAsFixed(1)} px'),
            _buildInfoRow('25% En Kısa Kenar', '${context.percentShortestSide(25).toStringAsFixed(1)} px'),
            _buildInfoRow('10% Alan', '${context.percentArea(10).toStringAsFixed(0)} px²'),
          ],
        ),
      ),
    );
  }

  Widget _buildDynamicSizingCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dinamik Boyutlandırma', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            _buildInfoRow('Dinamik Genişlik (100)', '${context.dynamicWidth(100).toStringAsFixed(1)} px'),
            _buildInfoRow('Dinamik Yükseklik (100)', '${context.dynamicHeight(100).toStringAsFixed(1)} px'),
            _buildInfoRow('Dinamik Font (16)', '${context.dynamicFontSize(16).toStringAsFixed(1)} px'),
            _buildInfoRow('Adaptif Font (16)', '${context.adaptiveFontSize(16).toStringAsFixed(1)} px'),
            _buildInfoRow('Responsive Boyut (50)', '${context.responsiveSize(50).toStringAsFixed(1)} px'),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveDemoCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Responsive Demo', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text(
              'Aşağıdaki örnekler farklı cihazlarda farklı boyutlarda görünür:',
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: context.dynamicHeight(16)),

            // Dinamik genişlikli container
            Container(
              width: context.dynamicWidth(200),
              height: context.dynamicHeight(60),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green),
              ),
              child: Center(
                child: Text(
                  'Dinamik Boyutlu Container\n${context.dynamicWidth(200).toInt()}x${context.dynamicHeight(60).toInt()}',
                  style: context.textTheme.bodySmall?.copyWith(fontSize: context.dynamicFontSize(12)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(height: context.dynamicHeight(12)),

            // Yüzdelik boyutlu container
            Container(
              width: context.percentWidth(80),
              height: context.dynamicHeight(60),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
              ),
              child: Center(
                child: Text(
                  'Ekranın %80\'i Genişlik\n${context.percentWidth(80).toInt()}x${context.dynamicHeight(60).toInt()}',
                  style: context.textTheme.bodySmall?.copyWith(fontSize: context.adaptiveFontSize(12)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: context.textTheme.bodyMedium),
          Text(
            value,
            style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceTypeChip(String label, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(12), vertical: context.dynamicHeight(6)),
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: context.textTheme.bodySmall?.copyWith(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
