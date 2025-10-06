// Validation utility functions for forms and data
class ValidationUtils {
  /// Validate phone number (basic Spanish format)
  static bool isValidPhoneNumber(String phone) {
    // Remove spaces and special characters
    final cleanPhone = phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // Check if it's a valid Spanish mobile (9 digits starting with 6, 7, or 9)
    // Or international format (+34...)
    if (cleanPhone.startsWith('+34')) {
      return cleanPhone.length == 12 &&
          RegExp(r'^\+34[679]\d{8}$').hasMatch(cleanPhone);
    }

    return cleanPhone.length == 9 &&
        RegExp(r'^[679]\d{8}$').hasMatch(cleanPhone);
  }

  /// Validate group name
  static bool isValidGroupName(String name) {
    return name.trim().isNotEmpty &&
        name.trim().length >= 3 &&
        name.trim().length <= 50;
  }

  /// Validate shuttle name
  static bool isValidShuttleName(String name) {
    return name.trim().isNotEmpty &&
        name.trim().length >= 3 &&
        name.trim().length <= 100;
  }

  /// Validate location name (origin/destination)
  static bool isValidLocation(String location) {
    return location.trim().isNotEmpty &&
        location.trim().length >= 2 &&
        location.trim().length <= 100;
  }

  /// Validate number of seats
  static bool isValidSeatCount(int seats) {
    return seats > 0 && seats <= 50; // Reasonable limits
  }

  /// Validate license plate (Spanish format)
  static bool isValidLicensePlate(String plate) {
    final cleanPlate = plate.replaceAll(RegExp(r'[\s\-]'), '').toUpperCase();

    // Spanish format: 1234ABC or 1234BBB
    return RegExp(r'^\d{4}[A-Z]{3}$').hasMatch(cleanPlate);
  }
}
