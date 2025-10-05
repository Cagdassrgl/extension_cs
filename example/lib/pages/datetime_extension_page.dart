import 'package:extension_cs/extension_cs.dart';
import 'package:flutter/material.dart';

class DateTimeExtensionPage extends StatefulWidget {
  const DateTimeExtensionPage({super.key});

  @override
  State<DateTimeExtensionPage> createState() => _DateTimeExtensionPageState();
}

class _DateTimeExtensionPageState extends State<DateTimeExtensionPage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DateTime Extensions'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildDateSelectorCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildTimeAgoCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildFormatCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildVersionCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildSameDateCard(context),
            SizedBox(height: context.dynamicHeight(20)),
            _buildExamplesCard(context),
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
              'DateTime Extensions',
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            SizedBox(height: context.dynamicHeight(8)),
            Text('Tarih ve saat işlemleri için kullanışlı extension metodları.', style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelectorCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tarih Seçici', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Seçilen Tarih: ${selectedDate.format('dd/MM/yyyy HH:mm')}',
                    style: context.textTheme.bodyLarge,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeAgoCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('timeAgo() Metodu', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text(
              'Seçilen tarih ile şu an arasındaki farkı insan okunabilir formatta gösterir:',
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: context.dynamicHeight(8)),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.dynamicWidth(12)),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange),
              ),
              child: Text(
                'selectedDate.timeAgo() = "${selectedDate.timeAgo()}"',
                style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.orange[800]),
              ),
            ),
            SizedBox(height: context.dynamicHeight(12)),
            _buildTimeAgoExamples(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeAgoExamples(BuildContext context) {
    final examples = [
      DateTime.now().subtract(const Duration(minutes: 5)),
      DateTime.now().subtract(const Duration(hours: 2)),
      DateTime.now().subtract(const Duration(days: 3)),
      DateTime.now().subtract(const Duration(days: 15)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Diğer Örnekler:', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height: context.dynamicHeight(8)),
        ...examples.map(
          (date) => Padding(
            padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(2)),
            child: Text('${date.format('dd/MM/yyyy HH:mm')} → ${date.timeAgo()}', style: context.textTheme.bodySmall),
          ),
        ),
      ],
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
            Text('format() Metodu', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('Tarihi istediğiniz formatta string\'e çevirir:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(12)),
            _buildFormatExample(context, 'dd/MM/yyyy', selectedDate.format('dd/MM/yyyy')),
            _buildFormatExample(context, 'yyyy-MM-dd', selectedDate.format('yyyy-MM-dd')),
            _buildFormatExample(context, 'HH:mm:ss', selectedDate.format('HH:mm:ss')),
            _buildFormatExample(context, 'dd/MM/yyyy HH:mm', selectedDate.format('dd/MM/yyyy HH:mm')),
            _buildFormatExample(context, 'dd.MM.yyyy - HH:mm:ss', selectedDate.format('dd.MM.yyyy - HH:mm:ss')),
          ],
        ),
      ),
    );
  }

  Widget _buildFormatExample(BuildContext context, String pattern, String result) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(4)),
      child: Row(
        children: [
          SizedBox(
            width: context.dynamicWidth(140),
            child: Text(
              'format("$pattern")',
              style: context.textTheme.bodySmall?.copyWith(fontFamily: 'monospace', color: Colors.blue[700]),
            ),
          ),
          const Text(' → '),
          Expanded(
            child: Text('"$result"', style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildVersionCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('version Property', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('Tarihin Unix zaman damgasını (milliseconds since epoch) döner:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(8)),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.dynamicWidth(12)),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Text(
                'selectedDate.version = ${selectedDate.version}',
                style: context.textTheme.bodyMedium?.copyWith(fontFamily: 'monospace'),
              ),
            ),
            SizedBox(height: context.dynamicHeight(8)),
            Text(
              'Bu değer veritabanında tarih karşılaştırmaları için kullanışlıdır.',
              style: context.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSameDateCard(BuildContext context) {
    final today = DateTime.now();
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    final sameDay = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 14, 30);

    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('isSameDate() Metodu', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: context.dynamicHeight(12)),
            Text('İki tarihin aynı gün olup olmadığını kontrol eder:', style: context.textTheme.bodyMedium),
            SizedBox(height: context.dynamicHeight(12)),
            _buildSameDateExample(
              context,
              'Bugün ile karşılaştırma',
              selectedDate,
              today,
              selectedDate.isSameDate(today),
            ),
            _buildSameDateExample(
              context,
              'Dün ile karşılaştırma',
              selectedDate,
              yesterday,
              selectedDate.isSameDate(yesterday),
            ),
            _buildSameDateExample(
              context,
              'Aynı gün farklı saat',
              selectedDate,
              sameDay,
              selectedDate.isSameDate(sameDay),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSameDateExample(BuildContext context, String title, DateTime date1, DateTime date2, bool result) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: context.dynamicHeight(4)),
          Row(
            children: [
              Icon(
                result ? Icons.check_circle : Icons.cancel,
                color: result ? Colors.green : Colors.red,
                size: context.dynamicWidth(20),
              ),
              SizedBox(width: context.dynamicWidth(8)),
              Expanded(
                child: Text(
                  '${date1.format('dd/MM/yyyy HH:mm')} == ${date2.format('dd/MM/yyyy HH:mm')} → $result',
                  style: context.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExamplesCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pratik Kullanım Örnekleri',
              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.dynamicHeight(12)),
            _buildCodeExample(
              context,
              'Chat uygulamasında mesaj zamanı:',
              'message.createdAt.timeAgo()',
              DateTime.now().subtract(const Duration(minutes: 15)).timeAgo(),
            ),
            _buildCodeExample(
              context,
              'Dosya adında tarih kullanımı:',
              'DateTime.now().format("yyyyMMdd_HHmmss")',
              DateTime.now().format('yyyyMMdd_HHmmss'),
            ),
            _buildCodeExample(context, 'API versiyonlama:', 'lastUpdate.version', DateTime.now().version.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeExample(BuildContext context, String description, String code, String result) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.dynamicHeight(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: context.dynamicHeight(4)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(context.dynamicWidth(8)),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: context.textTheme.bodySmall?.copyWith(fontFamily: 'monospace', color: Colors.blue[700]),
                ),
                Text(
                  '// Sonuç: $result',
                  style: context.textTheme.bodySmall?.copyWith(fontFamily: 'monospace', color: Colors.green[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
