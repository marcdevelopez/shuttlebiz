// String manipulation and formatting utilities
class StringUtils {
  /// Capitalize first letter of each word
  static String toTitleCase(String text) {
    if (text.isEmpty) return text;

    return text
        .split(' ')
        .map((word) => word.isEmpty
            ? word
            : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  /// Clean phone number for storage (remove formatting)
  static String cleanPhoneNumber(String phone) {
    return phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');
  }

  /// Format phone number for display (+34 XXX XXX XXX)
  static String formatPhoneNumber(String phone) {
    final clean = cleanPhoneNumber(phone);

    if (clean.startsWith('+34') && clean.length == 12) {
      return '+34 ${clean.substring(3, 6)} ${clean.substring(6, 9)} ${clean.substring(9)}';
    } else if (clean.length == 9) {
      return '${clean.substring(0, 3)} ${clean.substring(3, 6)} ${clean.substring(6)}';
    }

    return phone; // Return original if doesn't match expected format
  }

  /// Generate initials from name (for profile avatars)
  static String getInitials(String name) {
    if (name.isEmpty) return '';

    final words = name.trim().split(' ');
    if (words.length == 1) {
      return words[0][0].toUpperCase();
    }

    return '${words[0][0]}${words[1][0]}'.toUpperCase();
  }

  /// Truncate text with ellipsis
  static String truncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength - 3)}...';
  }

  /// Check if string is empty or only whitespace
  static bool isBlank(String? text) {
    return text == null || text.trim().isEmpty;
  }

  /// Remove diacritics for search (café -> cafe)
  static String removeAccents(String text) {
    return text
        .replaceAll('á', 'a')
        .replaceAll('Á', 'A')
        .replaceAll('é', 'e')
        .replaceAll('É', 'E')
        .replaceAll('í', 'i')
        .replaceAll('Í', 'I')
        .replaceAll('ó', 'o')
        .replaceAll('Ó', 'O')
        .replaceAll('ú', 'u')
        .replaceAll('Ú', 'U')
        .replaceAll('ñ', 'n')
        .replaceAll('Ñ', 'N')
        .replaceAll('ü', 'u')
        .replaceAll('Ü', 'U');
  }
}
