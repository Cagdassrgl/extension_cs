// ignore_for_file: deprecated_member_use

import 'package:extension_cs/extension_cs.dart';
import 'package:flutter/material.dart';

class WidgetExtensionPage extends StatefulWidget {
  const WidgetExtensionPage({super.key});

  @override
  State<WidgetExtensionPage> createState() => _WidgetExtensionPageState();
}

class _WidgetExtensionPageState extends State<WidgetExtensionPage> {
  bool isVisible = true;
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Extensions'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildPaddingMarginCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildSizingCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildAlignmentCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildDecorationCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildVisibilityCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildFlexCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildInteractiveCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildCardWrapperCard(context),
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
              'Widget Extensions',
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: context.dynamicHeight(8)),
            Text(
              'Widget\'ları sarmalayan ve decorator pattern\'i uygulayan kullanışlı extension metodları.',
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaddingMarginCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Padding ve Margin', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('withPadding() ve withMargin() metodları:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),

            // Padding örneği
            Container(
              color: Colors.red.withOpacity(0.1),
              child: const Text('Normal Widget')
                  .withPadding(EdgeInsets.all(16))
                  .withDecoration(
                    BoxDecoration(color: Colors.red.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                  ),
            ),

            SizedBox(height: context.dynamicHeight(12)),

            // Margin örneği
            Container(
              color: Colors.blue.withOpacity(0.1),
              width: double.infinity,
              child: const Text('Margin ile Widget')
                  .withMargin(EdgeInsets.all(20))
                  .withDecoration(
                    BoxDecoration(color: Colors.blue.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                  ),
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(context, 'Text("Hello").withPadding(EdgeInsets.all(16))'),
          ],
        ),
      ),
    );
  }

  Widget _buildSizingCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Boyutlandırma', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('withSize() metodu ile widget boyutlarını ayarlayabilirsiniz:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),

            Row(
              children: [
                Container(
                  color: Colors.green.withOpacity(0.2),
                  child: const Text('150x100').center
                      .withSize(width: 150, height: 100)
                      .withDecoration(
                        BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                ),

                SizedBox(width: context.dynamicWidth(16)),

                Container(
                  color: Colors.orange.withOpacity(0.2),
                  child: const Text('100x150').center
                      .withSize(width: 100, height: 150)
                      .withDecoration(
                        BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                ),
              ],
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(context, 'Text("Hello").withSize(width: 150, height: 100)'),
          ],
        ),
      ),
    );
  }

  Widget _buildAlignmentCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hizalama', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('center getter\'ı ve withAlignment() metodu:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),

            Container(
              height: context.dynamicHeight(120),
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.1),
                border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: const Text(
                      'Center',
                    ).center.withDecoration(BoxDecoration(color: Colors.purple.withOpacity(0.2))),
                  ),
                  Expanded(
                    child: const Text('Top Right')
                        .withAlignment(Alignment.topRight)
                        .withPadding(const EdgeInsets.all(8))
                        .withDecoration(BoxDecoration(color: Colors.purple.withOpacity(0.2))),
                  ),
                  Expanded(
                    child: const Text('Bottom Left')
                        .withAlignment(Alignment.bottomLeft)
                        .withPadding(const EdgeInsets.all(8))
                        .withDecoration(BoxDecoration(color: Colors.purple.withOpacity(0.2))),
                  ),
                ],
              ),
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(context, 'Text("Hello").center\nText("Hello").withAlignment(Alignment.topRight)'),
          ],
        ),
      ),
    );
  }

  Widget _buildDecorationCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dekorasyon', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('withDecoration() ve withOpacity() metodları:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),

            Row(
              children: [
                Expanded(
                  child: const Text('Gradient Background').center
                      .withPadding(const EdgeInsets.all(16))
                      .withDecoration(
                        BoxDecoration(
                          gradient: const LinearGradient(colors: [Colors.blue, Colors.purple]),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      )
                      .withMargin(const EdgeInsets.only(right: 8)),
                ),
                Expanded(
                  child: const Text('Shadow & Border').center
                      .withPadding(const EdgeInsets.all(16))
                      .withDecoration(
                        BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))],
                        ),
                      )
                      .withMargin(const EdgeInsets.only(left: 8)),
                ),
              ],
            ),

            SizedBox(height: context.dynamicHeight(16)),

            // Opacity slider
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Opacity: ${opacity.toStringAsFixed(1)}'),
                Slider(value: opacity, onChanged: (value) => setState(() => opacity = value)),
                const Text('Opacity Örneği').center
                    .withPadding(const EdgeInsets.all(16))
                    .withDecoration(BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(8)))
                    .withOpacity(opacity),
              ],
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(
              context,
              'Text("Hello").withOpacity(0.5)\nText("Hello").withDecoration(BoxDecoration(...))',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisibilityCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Görünürlük', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text(
              'visible() metodu ile widget görünürlüğünü kontrol edebilirsiniz:',
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: context.dynamicHeight(16)),

            Row(
              children: [
                Checkbox(value: isVisible, onChanged: (value) => setState(() => isVisible = value ?? false)),
                const Text('Widget\'i göster'),
              ],
            ),

            SizedBox(height: context.dynamicHeight(12)),

            Container(
              height: context.dynamicHeight(80),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Bu widget görünürlük kontrolü altında!').center
                  .withPadding(const EdgeInsets.all(16))
                  .withDecoration(BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.circular(8)))
                  .visible(isVisible, replacement: const Text('Widget gizli!').center),
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(context, 'Text("Hello").visible(isVisible)'),
          ],
        ),
      ),
    );
  }

  Widget _buildFlexCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flex Layout', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('expanded() ve flexible() metodları:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),

            Container(
              height: context.dynamicHeight(60),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text(
                    'Flex 1',
                  ).center.withDecoration(BoxDecoration(color: Colors.red.withOpacity(0.3))).expanded(flex: 1),
                  const Text(
                    'Flex 2',
                  ).center.withDecoration(BoxDecoration(color: Colors.green.withOpacity(0.3))).expanded(flex: 2),
                  const Text(
                    'Flex 1',
                  ).center.withDecoration(BoxDecoration(color: Colors.blue.withOpacity(0.3))).expanded(flex: 1),
                ],
              ),
            ),

            SizedBox(height: context.dynamicHeight(16)),

            Container(
              height: context.dynamicHeight(60),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text(
                    'Flexible',
                  ).center.withDecoration(BoxDecoration(color: Colors.orange.withOpacity(0.3))).flexible(flex: 2),
                  const Text(
                    'Fixed',
                  ).center.withSize(width: 80).withDecoration(BoxDecoration(color: Colors.purple.withOpacity(0.3))),
                  const Text(
                    'Flexible',
                  ).center.withDecoration(BoxDecoration(color: Colors.teal.withOpacity(0.3))).flexible(flex: 1),
                ],
              ),
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(context, 'Text("Hello").expanded(flex: 2)\nText("Hello").flexible(flex: 1)'),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Etkileşim', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('onTap() metodu ile widget\'leri tıklanabilir yapabilirsiniz:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),

            Row(
              children: [
                Expanded(
                  child: const Text('Tıkla!').center
                      .withPadding(const EdgeInsets.all(16))
                      .withDecoration(BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)))
                      .onTap(() {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text('İlk widget tıklandı!')));
                      }),
                ),

                SizedBox(width: context.dynamicWidth(12)),

                Expanded(
                  child: const Text('Ben de!').center
                      .withPadding(const EdgeInsets.all(16))
                      .withDecoration(BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)))
                      .onTap(() {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text('İkinci widget tıklandı!')));
                      }),
                ),
              ],
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(context, 'Text("Hello").onTap(() => print("Tapped!"))'),
          ],
        ),
      ),
    );
  }

  Widget _buildCardWrapperCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Card Wrapper', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('asCard() metodu ile widget\'leri Card ile sarmalayabilirsiniz:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(16)),

            Column(
              children: [
                const Text('Normal Card').center.withPadding(const EdgeInsets.all(16)).asCard(),

                SizedBox(height: context.dynamicHeight(12)),

                const Text(
                  'Yüksek Elevation',
                ).center.withPadding(const EdgeInsets.all(16)).asCard(elevation: 8, color: Colors.lightBlue[50]),

                SizedBox(height: context.dynamicHeight(12)),

                const Text('Custom Shape').center
                    .withPadding(const EdgeInsets.all(16))
                    .asCard(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.purple, width: 2),
                      ),
                      color: Colors.purple[50],
                    ),
              ],
            ),

            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(context, 'Text("Hello").asCard(elevation: 8)'),
          ],
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
