import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/constants/app_routes.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/utils/format.dart';
import 'package:storeapp/features/orders/domain/entities/geo_point.dart';
import 'package:storeapp/features/orders/domain/entities/picked_location.dart';
import 'package:storeapp/features/orders/presentation/cubit/checkout_form_cubit.dart';
import 'package:storeapp/features/orders/presentation/cubit/checkout_form_state.dart';

/// "Pick location on map" row. Opens the map and stores the result in the
/// [CheckoutFormCubit].
class CheckoutLocationTile extends StatelessWidget {
  const CheckoutLocationTile({super.key});

  Future<void> _pickLocation(BuildContext context, GeoPoint? current) async {
    FocusScope.of(context).unfocus();
    final form = context.read<CheckoutFormCubit>();
    final picked = await Navigator.pushNamed<PickedLocation>(
      context,
      AppRoutes.pickLocation,
      arguments: current,
    );
    if (picked != null) {
      form.locationPicked(picked.point, address: picked.address);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutFormCubit, CheckoutFormState>(
      buildWhen: (previous, current) =>
          previous.location != current.location ||
          previous.hasLocationError != current.hasLocationError,
      builder: (context, state) {
        final location = state.location;
        final hasError = state.hasLocationError;
        final picked = location != null;
        final borderColor = hasError
            ? AppColors.danger
            : picked
                ? AppColors.accent
                : AppColors.outline;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: AppColors.surface,
              child: InkWell(
                onTap: () => _pickLocation(context, location),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        picked ? Icons.location_on : Icons.map_outlined,
                        color: AppColors.textPrimary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              picked ? 'Location pinned' : 'Pick location on map',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            if (location != null)
                              Text(
                                formatCoordinates(location.lat, location.lng),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Text(
                        (picked ? 'Change' : 'Open map').toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w800,
                          color: AppColors.accent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (hasError)
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  'Pin your delivery location on the map',
                  style: TextStyle(color: AppColors.danger, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
