String _two(int n) => n.toString().padLeft(2, '0');

String formatDate(DateTime date) {
  return '${_two(date.day)}/${_two(date.month)}/${date.year}  '
      '${_two(date.hour)}:${_two(date.minute)}';
}

/// yyyy-MM-dd, the format the orders API expects.
String formatApiDate(DateTime date) {
  return '${date.year}-${_two(date.month)}-${_two(date.day)}';
}

String formatPrice(double price) => '\$${price.toStringAsFixed(2)}';

/// 30.04441 -> "30.04441, 31.23570"
String formatCoordinates(double lat, double lng) {
  return '${lat.toStringAsFixed(5)}, ${lng.toStringAsFixed(5)}';
}

/// 3 -> "03" (shown as the product number on cards).
String formatProductNumber(int id) => id.toString().padLeft(2, '0');
