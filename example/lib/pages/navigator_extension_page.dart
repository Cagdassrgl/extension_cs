import 'package:extension_cs/extension_cs.dart';
import 'package:flutter/material.dart';

class NavigatorExtensionPage extends StatelessWidget {
  const NavigatorExtensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Extensions'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildInfoCard(
              context,
              'Navigator Extension\'ları',
              'BuildContext üzerinden kolay sayfa geçişleri ve navigasyon işlemleri yapabilirsiniz.',
            ),
            SizedBox(height: context.dynamicHeight(20)),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: context.dynamicWidth(12),
                mainAxisSpacing: context.dynamicHeight(12),
                childAspectRatio: 1.2,
                children: [
                  _buildNavigationButton(
                    context,
                    'Push',
                    'Normal sayfa geçişi',
                    Icons.arrow_forward,
                    () => context.push(const SecondPage(title: 'Push ile açıldı')),
                  ),
                  _buildNavigationButton(
                    context,
                    'Push Replacement',
                    'Mevcut sayfayı değiştir',
                    Icons.swap_horiz,
                    () => context.pushReplacement(const SecondPage(title: 'Push Replacement ile açıldı')),
                  ),
                  _buildNavigationButton(
                    context,
                    'Fade Transition',
                    'Fade animasyonu ile',
                    Icons.animation,
                    () => context.pushWithFade(const SecondPage(title: 'Fade ile açıldı')),
                  ),
                  _buildNavigationButton(
                    context,
                    'Slide Transition',
                    'Slide animasyonu ile',
                    Icons.slideshow,
                    () => context.pushWithSlide(const SecondPage(title: 'Slide ile açıldı')),
                  ),
                  _buildNavigationButton(
                    context,
                    'Bottom Sheet',
                    'Modal bottom sheet',
                    Icons.vertical_align_bottom,
                    () => context.showBottomModal(_buildBottomSheetContent(context)),
                  ),
                  _buildNavigationButton(
                    context,
                    'Alert Dialog',
                    'Alert dialog göster',
                    Icons.announcement,
                    () => context.showAlert(_buildAlertDialog(context)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, String description) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.dynamicWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: context.dynamicHeight(8)),
            Text(description, style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.all(context.dynamicWidth(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: context.dynamicWidth(32), color: Colors.blue),
              SizedBox(height: context.dynamicHeight(8)),
              Text(
                title,
                style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.dynamicHeight(4)),
              Text(
                subtitle,
                style: context.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheetContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.dynamicWidth(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: context.dynamicWidth(40),
            height: context.dynamicHeight(4),
            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
          ),
          SizedBox(height: context.dynamicHeight(20)),
          const Icon(Icons.info, size: 50, color: Colors.blue),
          SizedBox(height: context.dynamicHeight(16)),
          Text('Bottom Sheet Örneği', style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: context.dynamicHeight(8)),
          Text(
            'Bu bir modal bottom sheet örneğidir. context.showBottomModal() ile açılmıştır.',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium,
          ),
          SizedBox(height: context.dynamicHeight(20)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => context.pop(), child: const Text('Kapat')),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Alert Dialog'),
      content: const Text('Bu bir alert dialog örneğidir. context.showAlert() ile açılmıştır.'),
      actions: [TextButton(onPressed: () => context.pop(), child: const Text('Tamam'))],
    );
  }
}

class SecondPage extends StatelessWidget {
  final String title;

  const SecondPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.green, foregroundColor: Colors.white),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(context.dynamicWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 80, color: Colors.green),
              SizedBox(height: context.dynamicHeight(20)),
              Text(
                title,
                style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.dynamicHeight(20)),
              Text(
                'Navigator extension\'ları ile kolay bir şekilde bu sayfaya geçiş yapıldı.',
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.dynamicHeight(40)),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: context.canPop() ? () => context.pop() : null,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Geri Dön'),
                    ),
                  ),
                  SizedBox(width: context.dynamicWidth(12)),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context.push(const ThirdPage()),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('İleri Git'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Üçüncü Sayfa'), backgroundColor: Colors.purple, foregroundColor: Colors.white),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(context.dynamicWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.layers, size: 80, color: Colors.purple),
              SizedBox(height: context.dynamicHeight(20)),
              Text('Üçüncü Sayfa', style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: context.dynamicHeight(20)),
              Text(
                'Bu sayfa navigator stack\'inde üçüncü seviyededir.',
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.dynamicHeight(40)),
              ElevatedButton.icon(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Bir Önceki Sayfaya Dön'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
