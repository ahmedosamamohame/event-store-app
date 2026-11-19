import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/theme/app_colors.dart';
import 'package:storeapp/features/orders/presentation/cubit/location_picker_cubit.dart';
import 'package:storeapp/features/orders/presentation/cubit/location_picker_state.dart';

/// Square button on the map that jumps to the device location.
class LocateMeButton extends StatelessWidget {
  const LocateMeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPickerCubit, LocationPickerState>(
      buildWhen: (previous, current) =>
          previous.isLocating != current.isLocating,
      builder: (context, state) {
        return Material(
          color: AppColors.cream,
          elevation: 3,
          child: InkWell(
            onTap: state.isLocating
                ? null
                : context.read<LocationPickerCubit>().locate,
            child: SizedBox(
              height: 48,
              width: 48,
              child: Center(
                child: state.isLocating
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.ink,
                        ),
                      )
                    : const Icon(Icons.my_location, color: AppColors.ink),
              ),
            ),
          ),
        );
      },
    );
  }
}
