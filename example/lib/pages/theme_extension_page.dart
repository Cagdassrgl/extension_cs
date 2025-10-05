import 'package:extension_cs/extension_cs.dart';
import 'package:flutter/material.dart';

class ThemeExtensionPage extends StatefulWidget {
  const ThemeExtensionPage({super.key});

  @override
  State<ThemeExtensionPage> createState() => _ThemeExtensionPageState();
}

class _ThemeExtensionPageState extends State<ThemeExtensionPage> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      child: Builder(
        builder: (themedContext) => Scaffold(
          appBar: AppBar(
            title: const Text('Theme Extensions'),
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  setState(() {
                    isDarkTheme = !isDarkTheme;
                  });
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(themedContext.dynamicWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoCard(themedContext),
                SizedBox(height: themedContext.dynamicHeight(20)),
                _buildColorSchemeCard(themedContext),
                SizedBox(height: themedContext.dynamicHeight(20)),
                _buildTextThemeCard(themedContext),
                SizedBox(height: themedContext.dynamicHeight(20)),
                _buildThemeColorsCard(themedContext),
                SizedBox(height: themedContext.dynamicHeight(20)),
                _buildThemeComponentsCard(themedContext),
              ],
            ),
          ),
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
              'Theme Extensions',
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            SizedBox(height: context.dynamicHeight(8)),
            Text(
              'Flutter tema bilgilerine kolay erişim için extension\'lar. Sağ üstteki buton ile tema değiştirebilirsiniz.',
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSchemeCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Color Scheme', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Wrap(
              spacing: context.dynamicWidth(8),
              runSpacing: context.dynamicHeight(8),
              children: [
                _buildColorChip(context, 'Primary', context.colorScheme.primary),
                _buildColorChip(context, 'Secondary', context.colorScheme.secondary),
                _buildColorChip(context, 'Surface', context.colorScheme.surface),
                _buildColorChip(context, 'Background', context.backgroundColor),
                _buildColorChip(context, 'Error', context.colorScheme.error),
                _buildColorChip(context, 'On Primary', context.colorScheme.onPrimary),
                _buildColorChip(context, 'On Secondary', context.colorScheme.onSecondary),
                _buildColorChip(context, 'On Surface', context.colorScheme.onSurface),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextThemeCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Text Theme', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            _buildTextExample(context, 'Display Large', context.textTheme.displayLarge),
            _buildTextExample(context, 'Headline Large', context.textTheme.headlineLarge),
            _buildTextExample(context, 'Headline Medium', context.textTheme.headlineMedium),
            _buildTextExample(context, 'Title Large', context.textTheme.titleLarge),
            _buildTextExample(context, 'Title Medium', context.textTheme.titleMedium),
            _buildTextExample(context, 'Body Large', context.textTheme.bodyLarge),
            _buildTextExample(context, 'Body Medium', context.textTheme.bodyMedium),
            _buildTextExample(context, 'Body Small', context.textTheme.bodySmall),
            _buildTextExample(context, 'Label Large', context.textTheme.labelLarge),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeColorsCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Colors (Extension Methods)',
              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.dynamicHeight(12)),
            Wrap(
              spacing: context.dynamicWidth(8),
              runSpacing: context.dynamicHeight(8),
              children: [
                _buildColorChip(context, 'Primary', context.primaryColor),
                _buildColorChip(context, 'Accent', context.accentColor),
                _buildColorChip(context, 'Background', context.backgroundColor),
                _buildColorChip(context, 'Scaffold BG', context.scaffoldBackgroundColor),
                _buildColorChip(context, 'Card', context.cardColor),
                _buildColorChip(context, 'Error', context.errorColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeComponentsCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Theme Components Demo', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(16)),

            // Buttons
            Text('Buttons:', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(8)),
            Wrap(
              spacing: context.dynamicWidth(8),
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
                OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
                TextButton(onPressed: () {}, child: const Text('Text')),
              ],
            ),

            SizedBox(height: context.dynamicHeight(16)),

            // Cards
            Text('Card with theme colors:', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(8)),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.dynamicWidth(16)),
              decoration: BoxDecoration(
                color: context.cardColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: context.colorScheme.outline),
              ),
              child: Text('Bu kart context.cardColor kullanıyor', style: context.textTheme.bodyMedium),
            ),

            SizedBox(height: context.dynamicHeight(16)),

            // Input Field
            Text('Input Field:', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(8)),
            TextField(
              decoration: InputDecoration(
                labelText: 'Theme based input',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: context.colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorChip(BuildContext context, String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(12), vertical: context.dynamicHeight(8)),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(color: color.contrastColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: context.dynamicHeight(2)),
          Text(
            color.toHex(),
            style: context.textTheme.bodySmall?.copyWith(
              color: color.contrastColor,
              fontSize: context.dynamicFontSize(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextExample(BuildContext context, String name, TextStyle? style) {
    if (style == null) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(4)),
      child: Row(
        children: [
          SizedBox(
            width: context.dynamicWidth(120),
            child: Text('$name:', style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Text('Örnek metin', style: style)),
        ],
      ),
    );
  }
}
