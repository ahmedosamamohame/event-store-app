import 'package:flutter_bloc/flutter_bloc.dart';

/// Ids of favorite products. Kept in memory only.
class FavoritesCubit extends Cubit<Set<int>> {
  FavoritesCubit() : super(const <int>{});

  bool isFavorite(int id) => state.contains(id);

  void toggle(int id) {
    final next = Set<int>.of(state);
    if (!next.add(id)) next.remove(id);
    emit(next);
  }
}
