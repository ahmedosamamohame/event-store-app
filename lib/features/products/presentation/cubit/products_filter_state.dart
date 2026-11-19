import 'package:equatable/equatable.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';

/// What the user typed / selected on the home screen.
class ProductsFilterState extends Equatable {
  const ProductsFilterState({
    this.query = '',
    this.category,
    this.onlyFavorites = false,
    this.searchResetCount = 0,
  });

  final String query;
  final String? category;
  final bool onlyFavorites;

  /// Changing this value recreates the search TextField (it is used as its
  /// key), which is how the field is emptied from code.
  final int searchResetCount;

  bool get hasQuery => query.isNotEmpty;

  bool get isAllSelected => !onlyFavorites && category == null;

  List<Product> apply(List<Product> products, Set<int> favorites) {
    final q = query.trim().toLowerCase();
    return products.where((p) {
      if (onlyFavorites && !favorites.contains(p.id)) return false;
      if (category != null && p.category != category) return false;
      if (q.isNotEmpty && !p.title.toLowerCase().contains(q)) return false;
      return true;
    }).toList();
  }

  ProductsFilterState copyWith({String? query, int? searchResetCount}) {
    return ProductsFilterState(
      query: query ?? this.query,
      category: category,
      onlyFavorites: onlyFavorites,
      searchResetCount: searchResetCount ?? this.searchResetCount,
    );
  }

  @override
  List<Object?> get props => [query, category, onlyFavorites, searchResetCount];
}
