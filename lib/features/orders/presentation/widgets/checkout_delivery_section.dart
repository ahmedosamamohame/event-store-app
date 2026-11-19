import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/widgets/app_input_decoration.dart';
import 'package:storeapp/features/orders/presentation/cubit/checkout_form_cubit.dart';
import 'package:storeapp/features/orders/presentation/cubit/checkout_form_state.dart';
import 'package:storeapp/features/orders/presentation/widgets/checkout_location_tile.dart';
import 'package:storeapp/features/orders/presentation/widgets/checkout_section_title.dart';

class CheckoutDeliverySection extends StatelessWidget {
  const CheckoutDeliverySection({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.read<CheckoutFormCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CheckoutSectionTitle('Delivery', number: '02'),
        BlocBuilder<CheckoutFormCubit, CheckoutFormState>(
          buildWhen: (previous, current) =>
              previous.addressError != current.addressError ||
              previous.addressVersion != current.addressVersion,
          builder: (context, state) {
            return TextFormField(
              key: ValueKey<int>(state.addressVersion),
              initialValue: state.address,
              onChanged: form.addressChanged,
              minLines: 2,
              maxLines: 3,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              decoration: appInputDecoration(
                'Address (street, building, floor)',
                icon: Icons.home_outlined,
                errorText: state.addressError,
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        const CheckoutLocationTile(),
        const SizedBox(height: 12),
        TextField(
          onChanged: form.notesChanged,
          maxLines: 2,
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.sentences,
          decoration: appInputDecoration(
            'Notes for the courier (optional)',
            icon: Icons.sticky_note_2_outlined,
          ),
        ),
      ],
    );
  }
}
