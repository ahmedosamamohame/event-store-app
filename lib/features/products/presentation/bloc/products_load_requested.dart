import 'package:storeapp/features/products/presentation/bloc/products_event.dart';

/// Load (or reload) the product list.
class ProductsLoadRequested extends ProductsEvent {
  const ProductsLoadRequested();
}
