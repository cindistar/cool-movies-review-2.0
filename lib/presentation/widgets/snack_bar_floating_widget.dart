import 'package:coolmovies/core/util/utils.dart';
import 'package:coolmovies/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SnackBarFloatingWidget {
  final BuildContext context;

  final String labelSnackbar;
  final Color? labelSnackbarFontColor;
  final Color? snackbarBackgroundColor;
  final Color? snackbarFontColor;
  final EdgeInsetsGeometry? margin;
  final Duration? duration;
  final double? snackbarHeight;

  final String labelButton;
  final VoidCallback buttonCallback;
  final Color? buttonBackgroundColor;
  final Color? buttonFontColor;

  const SnackBarFloatingWidget({
    required this.context,
    required this.labelSnackbar,
    this.snackbarBackgroundColor = MovieColors.greenApple,
    this.snackbarFontColor = Colors.black,
    this.duration = const Duration(seconds: 5),
    this.snackbarHeight = 48.0,
    this.margin,
    required this.labelButton,
    required this.buttonCallback,
    this.buttonBackgroundColor = MovieColors.lilacGarden,
    this.buttonFontColor = const Color(0xFF292929),
    this.labelSnackbarFontColor = Colors.black,
  });

  void show() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: snackbarBackgroundColor,
        margin: margin ??
            const EdgeInsets.only(
              bottom: 80.0,
              left: 16,
              right: 16,
            ),
        duration: duration!,
        content: SizedBox(
          height: snackbarHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .58,
                child: Text(
                  labelSnackbar,
                  style: TextStyle(
                    color: labelSnackbarFontColor,
                  ),
                ),
              ),
              CustomButtonWidget(
                label: labelButton,
                onPressed: buttonCallback,
                backgroundColor: buttonBackgroundColor,
                fontColor: buttonFontColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
