import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../Utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';

/// A widget that displays a Lottie animation with text and an optional action button.
class EAnimationLoaderWidget extends StatelessWidget {
  /// Default constructor for the EAnimationLoaderWidget.
  ///
  /// Parameters:
  /// - [text]: The text to be displayed below the animation.
  /// - [animation]: The path to the Lottie animation file.
  /// - [showAction]: Whether to show an action button below the text.
  /// - [actionText]: The text to be displayed on the action button.
  /// - [onActionPressed]: Callback function to be executed when the action button is pressed.
  const EAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText = '',
    this.onActionPressed,
    required this.height,
    required this.width,
    this.style,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String actionText;
  final VoidCallback? onActionPressed;
  final double height, width;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            height: height ?? MediaQuery.of(context).size.height * 0.5,
            width: width,
          ),
          const SizedBox(height: ESizes.defaultSpace),
          Text(
            text,
            style: style ?? Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ESizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: EColor.dark,
                    ),
                    child: Text(
                      actionText,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.apply(color: EColor.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
