import 'package:extension_cs/extension_cs.dart';
import 'package:flutter/material.dart';

import 'color_extension_page.dart';
import 'datetime_extension_page.dart';
import 'navigator_extension_page.dart';
import 'size_extension_page.dart';
import 'theme_extension_page.dart';
import 'widget_extension_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final extensionPages = [
      {
        'title': 'Navigator Extensions',
        'subtitle': 'Sayfa geçişleri ve navigasyon işlemleri',
        'icon': Icons.navigation,
        'page': const NavigatorExtensionPage(),
        'color': Colors.blue,
      },
      {
        'title': 'Size Extensions',
        'subtitle': 'Responsive boyutlandırma ve ekran bilgileri',
        'icon': Icons.aspect_ratio,
        'page': const SizeExtensionPage(),
        'color': Colors.green,
      },
      {
        'title': 'Theme Extensions',
        'subtitle': 'Tema ve renk yönetimi',
        'icon': Icons.palette,
        'page': const ThemeExtensionPage(),
        'color': Colors.purple,
      },
      {
        'title': 'DateTime Extensions',
        'subtitle': 'Tarih ve saat formatlaması',
        'icon': Icons.access_time,
        'page': const DateTimeExtensionPage(),
        'color': Colors.orange,
      },
      {
        'title': 'Widget Extensions',
        'subtitle': 'Widget wrapping ve decorator\'lar',
        'icon': Icons.widgets,
        'page': const WidgetExtensionPage(),
        'color': Colors.red,
      },
      {
        'title': 'Color Extensions',
        'subtitle': 'Renk manipülasyonu ve dönüşümler',
        'icon': Icons.color_lens,
        'page': const ColorExtensionPage(),
        'color': Colors.teal,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Extension CS Demo'),
        centerTitle: true,
        backgroundColor: context.theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        itemCount: extensionPages.length,
        itemBuilder: (context, index) {
          final page = extensionPages[index];
          return Container(
            margin: EdgeInsets.only(bottom: context.dynamicHeight(12)),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                contentPadding: EdgeInsets.all(context.dynamicWidth(16)),
                leading: Container(
                  width: context.dynamicWidth(50),
                  height: context.dynamicWidth(50),
                  decoration: BoxDecoration(
                    color: (page['color'] as Color).withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(page['icon'] as IconData, color: page['color'] as Color, size: context.dynamicWidth(28)),
                ),
                title: Text(
                  page['title'] as String,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: context.adaptiveFontSize(16),
                  ),
                ),
                subtitle: Text(
                  page['subtitle'] as String,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    fontSize: context.adaptiveFontSize(12),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: page['color'] as Color, size: context.dynamicWidth(20)),
                onTap: () {
                  context.push(page['page'] as Widget);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
