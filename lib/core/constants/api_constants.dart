class ApiConstants {
  const ApiConstants._();

  static const String baseUrl = 'https://fakestoreapi.com';
  static const String products = '$baseUrl/products';
  static const String carts = '$baseUrl/carts';

  static const Duration timeout = Duration(seconds: 15);
}
