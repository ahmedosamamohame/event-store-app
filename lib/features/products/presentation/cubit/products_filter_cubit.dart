import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/features/products/presentation/cubit/products_filter_state.dart';

class ProductsFilterCubit extends Cubit<ProductsFilterState> {
  ProductsFilterCubit() : super(const ProductsFilterState());

  void queryChanged(String value) => emit(state.copyWith(query: value));

  /// Empties the search field.
  void queryCleared() {
    emit(
      state.copyWith(query: '', searchResetCount: state.searchResetCount + 1),
    );
  }

  void showAll() {
    emit(
      ProductsFilterState(
        query: state.query,
        searchResetCount: state.searchResetCount,
      ),
    );
  }

  void showFavorites() {
    emit(
      ProductsFilterState(
        query: state.query,
        onlyFavorites: true,
        searchResetCount: state.searchResetCount,
      ),
    );
  }

  void selectCategory(String category) {
    emit(
      ProductsFilterState(
        query: state.query,
        category: category,
        searchResetCount: state.searchResetCount,
      ),
    );
  }

  /// Back to "everything": no search text, no category, no favorites filter.
  void reset() {
    emit(ProductsFilterState(searchResetCount: state.searchResetCount + 1));
  }
}
