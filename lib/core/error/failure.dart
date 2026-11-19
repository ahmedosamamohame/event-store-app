/// What the domain and presentation layers see when something goes wrong.
/// Every failure carries a message that is safe to show to the user.
abstract class Failure implements Exception {
  const Failure(this.message);

  final String message;

  @override
  String toString() => message;
}
