import 'package:flutter/material.dart';

enum ButtonType {
  primary,
  secondary,
  error,
  success,
  warning,
  neutral,
  transparent,
  filter,
  disabled
}

class Button extends StatefulWidget {
  const Button({
    required this.child,
    this.leadingIcon,
    this.headingWidget,
    this.type = ButtonType.primary,
    this.onPressed,
    this.styleOverride,
    super.key,
  });
  final Widget child;
  final IconData? leadingIcon;
  final Widget? headingWidget;
  final ButtonType type;

  final void Function()? onPressed;
  final ButtonStyle? styleOverride;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    Color contentColor = getContentColor(context: context, type: widget.type);
    return OutlinedButton(
      onPressed: widget.onPressed,
      style: widget.styleOverride ??
          getButtonStyle(context: context, type: widget.type),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:
            (widget.leadingIcon == null && widget.headingWidget == null)
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
        children: [
          if (widget.leadingIcon != null)
            Icon(widget.leadingIcon, size: 16, color: contentColor),
          if (widget.leadingIcon != null)
            const SizedBox(
              width: 6,
            ),
          widget.child,
          if (widget.headingWidget != null)
            const SizedBox(
              width: 6,
            ),
          if (widget.headingWidget != null) widget.headingWidget!
        ],
      ),
    );
  }
}

Color getContentColor({
  required BuildContext context,
  required ButtonType type,
}) {
  switch (type) {
    case ButtonType.primary:
      return Theme.of(context).colorScheme.onPrimary;
    case ButtonType.secondary:
      return Theme.of(context).colorScheme.onSecondary;
    case ButtonType.warning:
      return Theme.of(context).colorScheme.onBackground;
    case ButtonType.error:
      return Theme.of(context).colorScheme.background;
    case ButtonType.neutral:
      return Theme.of(context).colorScheme.tertiary;
    case ButtonType.transparent:
      return Theme.of(context).colorScheme.onSurface;
    case ButtonType.filter:
      return Theme.of(context).colorScheme.onBackground;
    case ButtonType.disabled:
      return Theme.of(context).colorScheme.surfaceVariant;
    default:
      return Theme.of(context).colorScheme.background;
  }
}

ButtonStyle getButtonStyle({
  required BuildContext context,
  required ButtonType type,
}) {
  switch (type) {
    case ButtonType.primary:
      return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primary,
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Colors.transparent,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primary.withOpacity(0.4),
        ),
        splashFactory: InkRipple.splashFactory,
      );

    case ButtonType.secondary:
      return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.secondary,
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Colors.transparent,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.secondary.withOpacity(0.4),
        ),
        splashFactory: InkRipple.splashFactory,
      );
    case ButtonType.warning:
      return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primaryContainer,
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
        ),
        splashFactory: InkRipple.splashFactory,
      );
    case ButtonType.error:
      return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.error,
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.error.withOpacity(0.4),
        ),
        splashFactory: InkRipple.splashFactory,
      );
    case ButtonType.neutral:
      return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xFFFFFFFF),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primary.withOpacity(0.4),
        ),
        splashFactory: InkRipple.splashFactory,
      );

    case ButtonType.transparent:
      return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.transparent,
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Colors.transparent,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
        ),
        splashFactory: InkRipple.splashFactory,
      );
    case ButtonType.filter:
      return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xFFFFFFFF),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Colors.transparent,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primary.withOpacity(0.4),
        ),
        splashFactory: InkRipple.splashFactory,
      );

    case ButtonType.disabled:
      return ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.background,
        disabledBackgroundColor: Theme.of(context).colorScheme.background,
        side: const BorderSide(
          color: Colors.transparent,
        ),
      );
    default:
      return ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        disabledBackgroundColor: Colors.green.withOpacity(0.3),
      );
  }
}
