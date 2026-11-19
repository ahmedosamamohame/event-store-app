import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';
import 'package:storeapp/features/orders/domain/entities/picked_location.dart';
import 'package:storeapp/features/orders/domain/usecases/get_address_for_location.dart';
import 'package:storeapp/features/orders/domain/usecases/get_current_location.dart';
import 'package:storeapp/features/orders/presentation/cubit/location_picker_cubit.dart';
import 'package:storeapp/features/orders/presentation/widgets/location_picker_footer.dart';
import 'package:storeapp/features/orders/presentation/widgets/location_picker_map.dart';

/// Full-screen map. It starts on the device location (when no [initial] pin is
/// given); tap anywhere to move the pin, then confirm.
/// Pops with a [PickedLocation] (pin + written address).
class LocationPickerPage extends StatelessWidget {
  const LocationPickerPage({super.key, this.initial});

  final GeoPoint? initial;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = LocationPickerCubit(
          initial: initial,
          getCurrentLocation: context.read<GetCurrentLocation>(),
          getAddress: context.read<GetAddressForLocation>(),
        );
        if (initial == null) unawaited(cubit.locate());
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('DELIVERY LOCATION')),
        body: Column(
          children: [
            Expanded(child: LocationPickerMap(initial: initial)),
            const LocationPickerFooter(),
          ],
        ),
      ),
    );
  }
}
