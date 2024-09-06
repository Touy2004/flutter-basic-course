import 'package:code_tutoorial/9/house_of_tomorrow/lib/src/service/theme_service.dart';
import 'package:code_tutoorial/9/house_of_tomorrow/lib/theme/component/button/button.dart';
import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      icon: 'arrow-left',
      color: context.color.text,
      type: ButtonType.flat,
      onPressed: () => Navigator.pop(context),
    );
  }
}
