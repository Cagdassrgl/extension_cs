import 'package:extension_cs/extension_cs.dart';
import 'package:flutter/material.dart';

class ColorExtensionPage extends StatefulWidget {
  const ColorExtensionPage({super.key});

  @override
  State<ColorExtensionPage> createState() => _ColorExtensionPageState();
}

class _ColorExtensionPageState extends State<ColorExtensionPage> {
  Color selectedColor = Colors.blue;

  final List<Color> colorOptions = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Extensions'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildColorSelectorCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildColorInfoCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildLightenDarkenCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildOpacityCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildInvertContrastCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildFormatCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildColorManipulationDemo(context),
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
              'Color Extensions',
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            SizedBox(height: context.dynamicHeight(8)),
            Text(
              'Renk manipülasyonu ve dönüşümler için kullanışlı extension metodları.',
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSelectorCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Renk Seçici', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('Test etmek istediğiniz rengi seçin:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),
            Wrap(
              spacing: context.dynamicWidth(8),
              runSpacing: context.dynamicHeight(8),
              children: colorOptions.map((color) {
                final isSelected = selectedColor.toARGB32() == color.toARGB32();
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = color),
                  child: Container(
                    width: context.dynamicWidth(50),
                    height: context.dynamicWidth(50),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? Colors.black : Colors.grey[300]!,
                        width: isSelected ? 3 : 1,
                      ),
                    ),
                    child: isSelected ? const Icon(Icons.check, color: Colors.white) : null,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorInfoCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Seçilen Renk Bilgileri', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Container(
              width: double.infinity,
              height: context.dynamicHeight(80),
              decoration: BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Center(
                child: Text(
                  'Seçilen Renk',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: selectedColor.contrastColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: context.dynamicHeight(16)),
            _buildColorInfoRow('RGB', selectedColor.toRgb),
            _buildColorInfoRow('Hex', selectedColor.toHex()),
            _buildColorInfoRow('Hex (no #)', selectedColor.toHex(leadingHashSign: false)),
            _buildColorInfoRow('Red', selectedColor.r.toString()),
            _buildColorInfoRow('Green', selectedColor.g.toString()),
            _buildColorInfoRow('Blue', selectedColor.b.toString()),
            _buildColorInfoRow('Alpha', selectedColor.a.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildLightenDarkenCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lighten & Darken', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text(
              'lighten() ve darken() metodları ile renkleri açıp koyulaştırabilirsiniz:',
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: context.dynamicHeight(16)),

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildColorSample(context, 'darken(0.3)', selectedColor.darken(0.3)),
                      SizedBox(height: context.dynamicHeight(8)),
                      _buildColorSample(context, 'darken(0.1)', selectedColor.darken(0.1)),
                      SizedBox(height: context.dynamicHeight(8)),
                      _buildColorSample(context, 'Orijinal', selectedColor),
                      SizedBox(height: context.dynamicHeight(8)),
                      _buildColorSample(context, 'lighten(0.1)', selectedColor.lighten(0.1)),
                      SizedBox(height: context.dynamicHeight(8)),
                      _buildColorSample(context, 'lighten(0.3)', selectedColor.lighten(0.3)),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(context, 'color.lighten(0.2) // %20 açık\ncolor.darken(0.2)  // %20 koyu'),
          ],
        ),
      ),
    );
  }

  Widget _buildOpacityCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Opacity Manipulation', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('withReducedOpacity() ve withValues() metodları:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildColorSample(context, 'Orijinal', selectedColor),
                      SizedBox(height: context.dynamicHeight(8)),
                      _buildColorSample(context, 'reducedOpacity(0.2)', selectedColor.withReducedOpacity(0.2)),
                      SizedBox(height: context.dynamicHeight(8)),
                      _buildColorSample(context, 'reducedOpacity(0.5)', selectedColor.withReducedOpacity(0.5)),
                      SizedBox(height: context.dynamicHeight(8)),
                      _buildColorSample(context, 'withValues(alpha: 0.3)', selectedColor.withValues(alpha: 0.3)),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(context, 'color.withReducedOpacity(0.5)\ncolor.withValues(alpha: 0.3)'),
          ],
        ),
      ),
    );
  }

  Widget _buildInvertContrastCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Invert & Contrast', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('invert ve contrastColor property\'leri:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: context.dynamicHeight(80),
                    decoration: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Center(
                      child: Text(
                        'Orijinal Renk\n${selectedColor.toHex()}',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: selectedColor.contrastColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: context.dynamicWidth(12)),

                Expanded(
                  child: Container(
                    height: context.dynamicHeight(80),
                    decoration: BoxDecoration(
                      color: selectedColor.invert,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Center(
                      child: Text(
                        'Inverted Renk\n${selectedColor.invert.toHex()}',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: selectedColor.invert.contrastColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: context.dynamicHeight(16)),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.dynamicWidth(12)),
              decoration: BoxDecoration(color: selectedColor, borderRadius: BorderRadius.circular(8)),
              child: Text(
                'Contrast color otomatik olarak ${selectedColor.contrastColor == Colors.black ? "siyah" : "beyaz"} seçildi.',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: selectedColor.contrastColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(
              context,
              'color.invert        // Rengi tersine çevir\ncolor.contrastColor // Siyah veya beyaz döner',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormatCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Format Methods', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('toHex() ve toRgb property\'leri ile renk formatları:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.dynamicWidth(16)),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hex Formatları:', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: context.dynamicHeight(8)),
                  Text('toHex(): ${selectedColor.toHex()}'),
                  Text('toHex(leadingHashSign: false): ${selectedColor.toHex(leadingHashSign: false)}'),

                  SizedBox(height: context.dynamicHeight(16)),

                  Text('RGB Formatı:', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: context.dynamicHeight(8)),
                  Text('toRgb: ${selectedColor.toRgb}'),

                  SizedBox(height: context.dynamicHeight(16)),

                  Text(
                    'Component Erişimi:',
                    style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: context.dynamicHeight(8)),
                  Text('Red: ${selectedColor.r}'),
                  Text('Green: ${selectedColor.g}'),
                  Text('Blue: ${selectedColor.b}'),
                  Text('Alpha: ${selectedColor.a}'),
                ],
              ),
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(
              context,
              'color.toHex()    // "#FF5722FF"\ncolor.toRgb      // "rgb(255, 87, 34)"\ncolor.red        // 255',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorManipulationDemo(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Color Manipulation Demo',
              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.dynamicHeight(12)),
            Text('Pratik kullanım örnekleri:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),

            // Gradient example
            Container(
              height: context.dynamicHeight(60),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [selectedColor.darken(0.2), selectedColor, selectedColor.lighten(0.2)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Gradient (darken → original → lighten)',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: selectedColor.contrastColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: context.dynamicHeight(12)),

            // Button variations
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedColor,
                      foregroundColor: selectedColor.contrastColor,
                    ),
                    child: const Text('Primary'),
                  ),
                ),

                SizedBox(width: context.dynamicWidth(8)),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedColor.lighten(0.3),
                      foregroundColor: selectedColor.lighten(0.3).contrastColor,
                    ),
                    child: const Text('Light'),
                  ),
                ),

                SizedBox(width: context.dynamicWidth(8)),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedColor.darken(0.2),
                      foregroundColor: selectedColor.darken(0.2).contrastColor,
                    ),
                    child: const Text('Dark'),
                  ),
                ),
              ],
            ),

            SizedBox(height: context.dynamicHeight(16)),

            // Overlay example
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: context.dynamicHeight(100),
                  decoration: BoxDecoration(color: selectedColor, borderRadius: BorderRadius.circular(8)),
                ),
                Container(
                  width: double.infinity,
                  height: context.dynamicHeight(100),
                  decoration: BoxDecoration(
                    color: selectedColor.withReducedOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Overlay with reduced opacity',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: selectedColor.contrastColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(4)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(
              value,
              style: context.textTheme.bodyMedium?.copyWith(fontFamily: 'monospace', color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSample(BuildContext context, String label, Color color) {
    return Container(
      height: context.dynamicHeight(40),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Center(
        child: Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(color: color.contrastColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildCodeExample(BuildContext context, String code) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.dynamicWidth(12)),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        code,
        style: context.textTheme.bodySmall?.copyWith(fontFamily: 'monospace', color: Colors.blue[700]),
      ),
    );
  }
}
