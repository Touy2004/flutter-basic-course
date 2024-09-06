import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/services/theme_service.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/asset_icon.dart';
import 'package:flutter/material.dart';

part 'button_size.dart';
part 'button_type.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.width,
    ButtonType? type,
    ButtonSize? size,
    bool? isInactive,
  })  : type = type ?? ButtonType.fill,
        size = size ?? ButtonSize.medium,
        isInactive = isInactive ?? false;

  /// Click event
  final void Function() onPressed;

  /// Button type and size
  final ButtonType type;
  final ButtonSize size;

  /// whether button is inactive
  final bool isInactive;

  /// Text and Icons
  final String? text;
  final String? icon;

  /// width
  final double? width;

  /// custom color
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  ///when button is pressed
  bool isPressed = false;

  /// 비활성화 여부
  bool get isInactive => isPressed || widget.isInactive;

  /// Text & Icon Color
  Color get color => widget.type.getColor(
        context,
        isInactive,
        widget.color,
      );

  /// Background Color
  Color get backgroundColor => widget.type.getBackgroundColor(
        context,
        isInactive,
        widget.backgroundColor,
      );

  /// Border
  Border? get border => widget.type.getBorder(
        context,
        isInactive,
        widget.borderColor,
      );

  /// button click event
  void onPressed(bool newIsPressed) {
    if (isPressed == newIsPressed) return;
    setState(() {
      isPressed = newIsPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// Click Event
      onTapUp: (details) {
        onPressed(false);
        if (!widget.isInactive) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => onPressed(true),
      onTapCancel: () => onPressed(false),

      /// Container
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: border,
        ),
        padding: EdgeInsets.all(widget.size.padding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Icon
            if (widget.icon != null)
              AssetIcon(
                widget.icon!,
                color: color,
              ),

            /// Gap
            if (widget.icon != null && widget.text != null)
              const SizedBox(width: 8),

            /// Text
            if (widget.text != null)
              Text(
                widget.text!,
                style: widget.size.getTextStyle(context).copyWith(
                      color: color,
                      fontWeight: context.typo.semiBold,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
