import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/widgets/bottom_action_bar.dart';
import 'package:storeapp/core/widgets/primary_button.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:storeapp/features/orders/presentation/bloc/order_submitted.dart';
import 'package:storeapp/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:storeapp/features/orders/presentation/bloc/orders_state.dart';
import 'package:storeapp/features/orders/presentation/cubit/checkout_form_cubit.dart';

class PlaceOrderBar extends StatelessWidget {
  const PlaceOrderBar({super.key});

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();

    final customer = context.read<CheckoutFormCubit>().submit();
    if (customer == null) return;

    context.read<OrdersBloc>().add(
          OrderSubmitted(
            items: context.read<CartCubit>().state.items,
            customer: customer,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BottomActionBar(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.outline)),
      ),
      child: BlocBuilder<OrdersBloc, OrdersState>(
        buildWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting,
        builder: (context, state) {
          return PrimaryButton(
            text: 'Place order',
            icon: Icons.check_circle_outline,
            isLoading: state.isSubmitting,
            onPressed: () => _submit(context),
          );
        },
      ),
    );
  }
}
