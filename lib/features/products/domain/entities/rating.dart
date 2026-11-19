import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  const Rating({required this.rate, required this.count});

  final double rate;
  final int count;

  @override
  List<Object?> get props => [rate, count];
}
