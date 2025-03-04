import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    deleteIconColor: EColor.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: EColor.black),
    selectedColor: EColor.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: EColor.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    deleteIconColor: EColor.darkerGrey,
    labelStyle: const TextStyle(color: EColor.white),
    selectedColor: EColor.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: EColor.white,
  );
}
