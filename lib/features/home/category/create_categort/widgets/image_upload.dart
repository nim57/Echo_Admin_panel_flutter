import 'dart:typed_data';

import 'package:echo_admin_panel_flutter/Utils/constants/colors.dart';
import 'package:echo_admin_panel_flutter/common/widgets/images/i_circularImage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icon/t_circular_icon.dart';

class EImageUploader extends StatelessWidget {
  const EImageUploader(
      {super.key,
      this.circular = false,
      this.image,
      required this.imageType,
      this.width = 100,
      this.height = 100,
      this.memoryImage,
      this.icon = Iconsax.edit_2,
      this.top,
      this.left = 0,
      this.right,
      this.bottom = 0,
      this.onIconButtonPressed});

  final bool circular;
  final String? image;
  final ImageType imageType;
  final double width;
  final double height;
  final Uint8List? memoryImage;
  final IconData? icon;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final void Function()? onIconButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Display image in either circular or rectangular shape
        circular ?
        TCircularImage(
          image: image ?? '',
          imageType: imageType,
          width: width,
          height: height,
          memoryImage: memoryImage,
          backgroundColor: EColor.primaryBackground,
        ) : 
        TCircularImage(
          image: image ?? '',
          imageType: imageType,
          width: width,
          height: height,
          memoryImage: memoryImage,
          backgroundColor: EColor.primaryBackground,
        ),

        /// Display the edit icon button on top of the image
        Positioned(
          top: top,
          left: left,
          right: right,
          bottom: bottom,
          child: TcircularIcon(
            icon: icon ?? Iconsax.edit_2,
            color: EColor.white,
            backgroundColor: EColor.primaryColor.withOpacity(0.9),
            onPressed: onIconButtonPressed,
          )
        ),
      ],
    );
  }
}
