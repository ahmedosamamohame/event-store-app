import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/core/utils/format.dart';
import 'package:storeapp/core/widgets/primary_button.dart';
import 'package:storeapp/features/orders/presentation/cubit/location_picker_cubit.dart';
import 'package:storeapp/features/orders/presentation/cubit/location_picker_state.dart';

class LocationPickerFooter extends StatelessWidget {
  const LocationPickerFooter({super.key});

  String _hint(LocationPickerState state) {
    final point = state.point;
    if (state.isLocating) return 'Finding your location...';
    if (point == null) return 'Tap the map to drop a pin on your address';
    return formatCoordinates(point.lat, point.lng);
  }

  Future<void> _confirm(BuildContext context) async {
    final navigator = Navigator.of(context);
    final picked = await context.read<LocationPickerCubit>().confirm();
    if (picked != null) navigator.pop(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.outline)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
          child: BlocBuilder<LocationPickerCubit, LocationPickerState>(
            builder: (context, state) {
              final message = state.message;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message ?? _hint(state),
                    style: TextStyle(
                      color: message == null
                          ? AppColors.textSecondary
                          : AppColors.danger,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    text: 'Confirm location',
                    icon: Icons.check_rounded,
                    isLoading: state.isConfirming,
                    onPressed:
                        state.point == null ? null : () => _confirm(context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
