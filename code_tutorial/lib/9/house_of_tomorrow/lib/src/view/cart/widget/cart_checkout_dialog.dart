import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/service/theme_service.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/theme/component/base_dialog.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/theme/component/button/button.dart';
import 'package:code_tutoorial/utils/lang/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartCheckoutDialog extends StatelessWidget {
  const CartCheckoutDialog({
    super.key,
    required this.onCheckoutPressed,
  });

  final void Function() onCheckoutPressed;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: S.current.checkout,
      content: Text(
        S.current.checkoutDialogDesc,
        style: context.typo.headline6,
      ),
      actions: [
        /// Checkout
        Button(
          text: S.current.checkout,
          width: double.infinity,
          color: context.color.onPrimary,
          backgroundColor: context.color.primary,
          onPressed: () {
            Navigator.pop(context);
            onCheckoutPressed();
          },
        ),
        const SizedBox(height: 12),

        /// Cancel
        Button(
          text: S.current.cancel,
          width: double.infinity,
          color: context.color.text,
          borderColor: context.color.hint,
          type: ButtonType.outline,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
