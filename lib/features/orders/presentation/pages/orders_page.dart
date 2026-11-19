import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/widgets/content_width.dart';
import 'package:storeapp/core/widgets/fade_slide_in.dart';
import 'package:storeapp/core/widgets/section_heading.dart';
import 'package:storeapp/core/widgets/state_message.dart';
import 'package:storeapp/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:storeapp/features/orders/presentation/bloc/orders_state.dart';
import 'package:storeapp/features/orders/presentation/widgets/order_card.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MY ORDERS')),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        buildWhen: (previous, current) => previous.orders != current.orders,
        builder: (context, state) {
          final orders = state.orders;
          if (orders.isEmpty) {
            return const StateMessage(
              icon: Icons.receipt_long_outlined,
              title: 'No orders yet',
              message: 'Orders you place will show up here.',
            );
          }

          return ContentWidth(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 24),
              itemCount: orders.length + 1,
              separatorBuilder: (context, index) =>
                  SizedBox(height: index == 0 ? 0 : 16),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return SectionHeading(title: 'My orders', count: orders.length);
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FadeSlideIn(
                    delay: Duration(milliseconds: (index % 6) * 70),
                    child: OrderCard(order: orders[index - 1]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
