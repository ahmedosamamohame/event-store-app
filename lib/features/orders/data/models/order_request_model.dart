import 'package:storeapp/core/utils/format.dart';
import 'package:storeapp/features/cart/domain/entities/cart_item.dart';
import 'package:storeapp/features/orders/domain/entities/customer_info.dart';

/// The JSON body sent to `POST /carts`.
///
/// `userId`, `date` and `products` are what the Fake Store API understands.
/// `customer` is extra data for your own backend; the demo API ignores it.
class OrderRequestModel {
  const OrderRequestModel({
    required this.items,
    required this.customer,
    required this.date,
  });

  final List<CartItem> items;
  final CustomerInfo customer;
  final DateTime date;

  Map<String, dynamic> toJson() => {
        'userId': 1,
        'date': formatApiDate(date),
        'products': [
          for (final item in items)
            {'productId': item.product.id, 'quantity': item.quantity},
        ],
        'customer': {
          'name': customer.name,
          'phone': customer.phone,
          'address': customer.address,
          'notes': customer.notes,
          'location': {
            'lat': customer.location.lat,
            'lng': customer.location.lng,
          },
        },
      };
}
