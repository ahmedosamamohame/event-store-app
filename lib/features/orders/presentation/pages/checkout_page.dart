import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/features/orders/presentation/cubit/checkout_form_cubit.dart';
import 'package:storeapp/features/orders/presentation/widgets/checkout_view.dart';

/// Owns the form state ([CheckoutFormCubit]); the screen itself is
/// [CheckoutView].
class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckoutFormCubit(),
      child: const CheckoutView(),
    );
  }
}
