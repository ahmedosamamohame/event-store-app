import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/constants/app_routes.dart';
import 'package:storeapp/core/widgets/content_width.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:storeapp/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:storeapp/features/orders/presentation/bloc/orders_state.dart';
import 'package:storeapp/features/orders/presentation/bloc/place_order_status.dart';
import 'package:storeapp/features/orders/presentation/widgets/checkout_contact_section.dart';
import 'package:storeapp/features/orders/presentation/widgets/checkout_delivery_section.dart';
import 'package:storeapp/features/orders/presentation/widgets/checkout_payment_section.dart';
import 'package:storeapp/features/orders/presentation/widgets/checkout_summary_section.dart';
import 'package:storeapp/features/orders/presentation/widgets/place_order_bar.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  void _onOrdersChanged(BuildContext context, OrdersState state) {
    final messenger = ScaffoldMessenger.of(context);

    if (state.status == PlaceOrderStatus.success) {
      context.read<CartCubit>().clear();
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(const SnackBar(content: Text('Order placed')));
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.orders,
        (route) => route.settings.name == AppRoutes.home,
      );
    } else if (state.status == PlaceOrderStatus.failure) {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(state.errorMessage ?? 'Could not place the order.'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersBloc, OrdersState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: _onOrdersChanged,
      child: Scaffold(
        appBar: AppBar(title: const Text('CHECKOUT')),
        body: const ContentWidth(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckoutContactSection(),
                SizedBox(height: 24),
                CheckoutDeliverySection(),
                SizedBox(height: 24),
                CheckoutPaymentSection(),
                SizedBox(height: 24),
                CheckoutSummarySection(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const PlaceOrderBar(),
      ),
    );
  }
}
