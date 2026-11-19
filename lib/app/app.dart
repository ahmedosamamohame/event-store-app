import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/app/dependencies.dart';
import 'package:storeapp/app/router.dart';
import 'package:storeapp/core/constants/app_routes.dart';
import 'package:storeapp/core/theme/app_theme.dart';
import 'package:storeapp/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:storeapp/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:storeapp/features/orders/domain/usecases/get_address_for_location.dart';
import 'package:storeapp/features/orders/domain/usecases/get_current_location.dart';
import 'package:storeapp/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:storeapp/features/products/presentation/bloc/products_bloc.dart';
import 'package:storeapp/features/products/presentation/bloc/products_load_requested.dart';
import 'package:storeapp/features/products/presentation/cubit/products_filter_cubit.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key, required this.dependencies});

  final Dependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GetCurrentLocation>.value(
          value: dependencies.getCurrentLocation,
        ),
        RepositoryProvider<GetAddressForLocation>.value(
          value: dependencies.getAddressForLocation,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(
            create: (_) => ProductsBloc(dependencies.getProducts)
              ..add(const ProductsLoadRequested()),
          ),
          BlocProvider<ProductsFilterCubit>(
            create: (_) => ProductsFilterCubit(),
          ),
          BlocProvider<FavoritesCubit>(create: (_) => FavoritesCubit()),
          BlocProvider<CartCubit>(create: (_) => CartCubit()),
          BlocProvider<OrdersBloc>(
            create: (_) => OrdersBloc(dependencies.placeOrder),
          ),
        ],
        child: MaterialApp(
          title: 'Event Store',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark,
          themeMode: ThemeMode.dark,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRoutes.home,
        ),
      ),
    );
  }
}
