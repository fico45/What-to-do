import 'package:flutter/material.dart';
import 'package:what_to_do/theme/theme_data.dart';

class SizeConst {
  static const double sizeXXS = 4.0;
  static const double sizeXS = 8.0;
  static const double sizeS = 16.0;
  static const double sizeM = 24.0;
  static const double sizeL = 32.0;
  static const double sizeXL = 48.0;
  static const double sizeXXL = 64.0;
}

class FormStyleConst {
  static final InputDecoration defaultInputDecoration = InputDecoration(
      fillColor: Colors.white,
      filled: true,
      disabledBorder: FormInputBorderConst.outlinedInputBorder,
      enabledBorder: FormInputBorderConst.outlinedInputBorder,
      focusedBorder: FormInputBorderConst.outlinedInputBorder,
      focusedErrorBorder: FormInputBorderConst.errorInputBorder,
      errorBorder: FormInputBorderConst.errorInputBorder,
      contentPadding: const EdgeInsets.all(16),
      hintStyle: CustomTheme.light.textTheme.bodyLarge!
          .copyWith(color: CustomTheme.light.colorScheme.surfaceVariant));
}

class FormInputBorderConst {
  static OutlineInputBorder errorInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: CustomTheme.light.colorScheme.error,
      width: 2,
    ),
  );
  static OutlineInputBorder outlinedInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: CustomTheme.light.colorScheme.primary,
      width: 2,
    ),
  );
}

class LayoutConst {
  static const EdgeInsets formPadding = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets formLabelPadding = EdgeInsets.all(8.0);
}
