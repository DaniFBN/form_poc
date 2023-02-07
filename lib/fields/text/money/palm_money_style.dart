import 'package:flutter/material.dart';

class PalmMoneyStyle extends ThemeExtension<PalmMoneyStyle> {
  final Color errorColor;

  const PalmMoneyStyle({required this.errorColor});

  static PalmMoneyStyle of(BuildContext context) {
    return Theme.of(context).extension<PalmMoneyStyle>()!;
  }

  @override
  ThemeExtension<PalmMoneyStyle> copyWith({Color? errorColor}) {
    return PalmMoneyStyle(
      errorColor: errorColor ?? this.errorColor,
    );
  }

  @override
  ThemeExtension<PalmMoneyStyle> lerp(
    ThemeExtension<PalmMoneyStyle>? other,
    double t,
  ) {
    return this;
  }
}
