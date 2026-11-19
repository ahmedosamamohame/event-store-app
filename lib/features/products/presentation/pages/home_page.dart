import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/core/constants/app_routes.dart';
import 'package:storeapp/core/theme/app_text_styles.dart';
import 'package:storeapp/core/widgets/state_message.dart';
import 'package:storeapp/features/cart/presentation/widgets/cart_button.dart';
import 'package:storeapp/features/products/presentation/bloc/products_bloc.dart';
import 'package:storeapp/features/products/presentation/bloc/products_load_requested.dart';
import 'package:storeapp/features/products/presentation/bloc/products_state.dart';
import 'package:storeapp/features/products/presentation/widgets/products_skeleton.dart';
import 'package:storeapp/features/products/presentation/widgets/products_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _reload(BuildContext context) {
    context.read<ProductsBloc>().add(const ProductsLoadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductsBloc, ProductsState>(
      // A reload that fails keeps the old list, so tell the user with a snack
      // bar instead of replacing the screen.
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.isFailure &&
          current.hasProducts,
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Could not reload products.'),
            ),
          );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('EVENT STORE', style: AppTextStyles.logo),
          leading: IconButton(
            tooltip: 'My orders',
            onPressed: () => Navigator.pushNamed(context, AppRoutes.orders),
            icon: const Icon(Icons.receipt_long_outlined),
          ),
          actions: [
            IconButton(
              tooltip: 'Reload',
              onPressed: () => _reload(context),
              icon: const FaIcon(FontAwesomeIcons.arrowsRotate, size: 17),
            ),
            const CartButton(),
            const SizedBox(width: 4),
          ],
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state.hasProducts) {
              return ProductsView(
                products: state.products,
                isRefreshing: state.isLoading,
              );
            }
            if (state.isFailure) {
              return StateMessage(
                icon: Icons.cloud_off,
                title: 'Could not load products',
                message: state.errorMessage,
                actionLabel: 'Try again',
                onAction: () => _reload(context),
              );
            }
            return const ProductsSkeleton();
          },
        ),
      ),
    );
  }
}
