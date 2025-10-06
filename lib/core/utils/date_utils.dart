// Date and time utility functions
class DateUtils {
  /// Format DateTime to DD/MM/YYYY string
  static String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  /// Format DateTime to HH:MM string
  static String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  /// Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Get day name in Spanish (Lunes, Martes, etc.)
  static String getDayName(int weekday) {
    const days = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo'
    ];
    return days[weekday - 1];
  }

  /// Parse time string (HH:MM) to DateTime
  static DateTime parseTimeString(String timeString) {
    final parts = timeString.split(':');
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, int.parse(parts[0]), int.parse(parts[1]));
  }
}
