import 'dart:io' as io;
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../Utils/constants/sizes.dart';
import '../templates/shimmer.dart';

enum ImageType {
  network,
  memory,
  file,
  asset,
}

class ERoundeImage extends StatelessWidget {
  const ERoundeImage({
    super.key,
    this.width = 56.0,
    this.height = 56.0,
    this.applyImageRadius = true,
    this.boarder,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding = ESizes.sm,
    this.isNetworkingImage = false,
    this.onPressed,
    this.borderRadus = ESizes.md,
    this.file,
    this.memoryImage,
    this.margin,
    this.image,
    this.overlayColor,
    required this.imageType,
  });

  final double? width, height;
  final bool applyImageRadius;
  final BoxBorder? boarder;
  final Color? backgroundColor;
  final BoxFit? fit;
  final double padding;
  final bool isNetworkingImage;
  final VoidCallback? onPressed;
  final double borderRadus;
  final io.File? file;
  final Uint8List? memoryImage;
  final double? margin;
  final String? image;
  final Color? overlayColor;
  final ImageType imageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: boarder,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadus),
      ),
      child: _buildImageWidget(),
    );
  }

  Widget _buildImageWidget() {
    Widget imageWidget;
    switch (imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemoryImage();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
      case ImageType.asset:
        imageWidget = _buildAssetImage();
        break;
    }

    // Apply ClipRRect to the image widget
    return ClipRRect(
      borderRadius: applyImageRadius
          ? BorderRadius.circular(borderRadus)
          : BorderRadius.zero,
      child: imageWidget,
    );
  }

  // Function to build the network image widget
  Widget _buildNetworkImage() {
    if (image != null) {
      // Use CachedNetworkImage for efficient loading and caching of network images
      // Not working in Web but just for loading
      return CachedNetworkImage(
        fit: fit,
        color: overlayColor,
        imageUrl: image!,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            EShimmerEffect(width: 56, height: 56),
      );
    } else {
      // Return an empty container if no image is provided
      return Container();
    }
  }

  // Function to build the memory image widget
  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      // Display image from memory using Image widget
      return Image(
        fit: fit,
        image: MemoryImage(memoryImage!),
        color: overlayColor,
      );
    } else {
      // Return an empty container if no image is provided
      return Container();
    }
  }

  // Function to build the file image widget
  Widget _buildFileImage() {
    if (file != null) {
      // Display image from file using Image widget
      return Image(
        fit: fit,
        image: FileImage(file!),
        color: overlayColor,
      );
    } else {
      // Return an empty container if no image is provided
      return Container();
    }
  }

  // Function to build the asset image widget
  Widget _buildAssetImage() {
    if (image != null) {
      // Display image from assets using Image widget
      return Image(
        fit: fit,
        image: AssetImage(image!),
        color: overlayColor,
      );
    } else {
      // Return an empty container if no image is provided
      return Container();
    }
  }
}
