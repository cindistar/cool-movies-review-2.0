import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/presentation/widgets/snack_bar_floating_widget.dart';
import 'package:flutter/material.dart';

mixin SnackBarMixin {
  showSnackbarWithGenericErrorMessage(
      BuildContext context, String labelSnackbar) {
    return SnackBarFloatingWidget(
      context: context,
      labelSnackbar: labelSnackbar,
      labelButton: MovieWords.close,
      snackbarBackgroundColor: MovieColors.redMaple,
      snackbarFontColor: Colors.black,
      buttonBackgroundColor: MovieColors.lilacGarden,
      buttonFontColor: Colors.black,
      margin: const EdgeInsets.only(
        bottom: 82,
        left: 16,
        right: 16,
      ),
      buttonCallback: () {
        ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
      },
    ).show();
  }

  showSnackbarCreateReviewSuccess(BuildContext context, String labelSnackbar) {
    SnackBarFloatingWidget(
      context: context,
      duration: const Duration(seconds: 3),
      labelSnackbar: labelSnackbar,
      labelButton: MovieWords.close,
      margin: const EdgeInsets.only(
        bottom: 16.0,
        left: 16,
        right: 16,
      ),
      buttonCallback: () {
        ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
      },
    ).show();
  }
}
