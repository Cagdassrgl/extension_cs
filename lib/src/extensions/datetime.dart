extension DateTimeExtension on DateTime {
  /// Tarihin Unix zaman damgasını (milliseconds since epoch) döner
  int get version {
    return toUtc().millisecondsSinceEpoch;
  }

  /// İki tarih arasındaki farkı insan okunabilir formatta döner
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 8) {
      return '$day/$month/$year';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} gün önce';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} saat önce';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} dakika önce';
    } else {
      return 'şimdi';
    }
  }

  /// Tarihi belirli bir formatta string olarak döner
  /// Örnek: DateTime.now().format('dd/MM/yyyy HH:mm')
  String format(String pattern) {
    final replacements = {
      'dd': day.toString().padLeft(2, '0'),
      'MM': month.toString().padLeft(2, '0'),
      'yyyy': year.toString(),
      'HH': hour.toString().padLeft(2, '0'),
      'mm': minute.toString().padLeft(2, '0'),
      'ss': second.toString().padLeft(2, '0'),
    };
    var formatted = pattern;
    replacements.forEach((key, value) {
      formatted = formatted.replaceAll(key, value);
    });
    return formatted;
  }

  /// İki tarihin aynı gün olup olmadığını kontrol eder
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
