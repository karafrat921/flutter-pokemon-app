import 'package:flutter/material.dart';
import '../../presentation/widget/custom_snack_bar.dart';
import '../enums/snack_bar_type.dart';

class Utils {
  Utils._();

  static void showMessage({
    required String message,
    required BuildContext context,
    Function()? onTap,
    SnackBarType snackBarType = SnackBarType.info,
  }) {
    final color = _getSnackBarColor(snackBarType);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSnackBar(context, message, color, onTap);
    });

    _hide(context);
  }

  static Color _getSnackBarColor(SnackBarType snackBarType) {
    switch (snackBarType) {
      case SnackBarType.error:
        return Colors.red.shade900;
      case SnackBarType.success:
        return Colors.green.shade900;
      default:
        return Colors.orange.shade900;
    }
  }

  static void _showSnackBar(BuildContext context, String message, Color color, Function()? onTap) {
    ScaffoldMessenger.of(context).showSnackBar(
      CustomSnackBar(
        color: color,
        onTap: onTap,
        message: message,
      ),
    );
  }

  static String capitalize(String str) => str.isNotEmpty ? str[0].toUpperCase() + str.substring(1) : str;

  static void _hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
  }
}
