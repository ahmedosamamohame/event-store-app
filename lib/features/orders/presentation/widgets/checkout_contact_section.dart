import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/core/widgets/app_input_decoration.dart';
import 'package:storeapp/features/orders/presentation/cubit/checkout_form_cubit.dart';
import 'package:storeapp/features/orders/presentation/cubit/checkout_form_state.dart';
import 'package:storeapp/features/orders/presentation/widgets/checkout_section_title.dart';

class CheckoutContactSection extends StatelessWidget {
  const CheckoutContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.read<CheckoutFormCubit>();

    return BlocBuilder<CheckoutFormCubit, CheckoutFormState>(
      buildWhen: (previous, current) =>
          previous.nameError != current.nameError ||
          previous.phoneError != current.phoneError,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CheckoutSectionTitle('Contact', number: '01'),
            TextField(
              onChanged: form.nameChanged,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              decoration: appInputDecoration(
                'Full name',
                icon: Icons.person_outline,
                errorText: state.nameError,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              onChanged: form.phoneChanged,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9+ ]')),
                LengthLimitingTextInputFormatter(15),
              ],
              decoration: appInputDecoration(
                'Phone number',
                icon: Icons.phone_outlined,
                errorText: state.phoneError,
              ),
            ),
          ],
        );
      },
    );
  }
}
