/// Form validators. Each returns an error message, or null when valid.
class Validators {
  const Validators._();

  static final RegExp _egyptMobile = RegExp(r'^01[0125]\d{8}$');

  static String? name(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'Enter your full name';
    if (v.length < 3) return 'Name is too short';
    return null;
  }

  /// Accepts 01xxxxxxxxx, +201xxxxxxxxx and 00201xxxxxxxxx.
  static String? phone(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'Enter your phone number';
    if (!_egyptMobile.hasMatch(normalizePhone(v))) {
      return 'Enter a valid mobile number (01xxxxxxxxx)';
    }
    return null;
  }

  static String? address(String? value) {
    final v = (value ?? '').trim();
    if (v.isEmpty) return 'Enter your delivery address';
    if (v.length < 10) return 'Add more detail (street, building, floor)';
    return null;
  }

  static String normalizePhone(String raw) {
    var v = raw.replaceAll(RegExp(r'[\s\-]'), '');
    if (v.startsWith('+20')) v = '0${v.substring(3)}';
    if (v.startsWith('0020')) v = '0${v.substring(4)}';
    return v;
  }
}
