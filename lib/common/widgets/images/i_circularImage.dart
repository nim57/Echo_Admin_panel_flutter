import 'dart:typed_data';
import 'dart:html' as html;
import 'dart:io' as io;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../layouts/templates/shimmer.dart';

// Enum to specify image type
enum ImageType { network, memory, file, asset }

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkingImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = ESizes.sm,
    this.file,
    this.imageType = ImageType.asset,
    this.memoryImage,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkingImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final dynamic
      file; // Changed to dynamic to handle both web and mobile File types
  final ImageType imageType;
  final Uint8List? memoryImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (EHelperFunctions.isDarkMode(context)
                ? EColor.black
                : EColor.white),
        borderRadius: BorderRadius.circular(width >= height ? width : height),
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
      borderRadius: BorderRadius.circular(width >= height ? width : height),
      child: imageWidget,
    );
  }

  // Function to build the network image widget
  Widget _buildNetworkImage() {
    if (image.isNotEmpty) {
      return CachedNetworkImage(
        fit: fit,
        color: overlayColor,
        imageUrl: image,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            EShimmerEffect(width: 56, height: 56),
      );
    } else {
      return Container();
    }
  }

  // Function to build the memory image widget
  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      return Image(
        fit: fit,
        image: MemoryImage(memoryImage!),
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }

  // Function to build the file image widget
  Widget _buildFileImage() {
    if (file != null) {
      // Cross-platform file handling
      if (kIsWeb) {
        // For web, use html.File
        if (file is html.File) {
          return Image.network(
            html.Url.createObjectUrl(file),
            fit: fit,
            color: overlayColor,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
          );
        }
      } else {
        // For mobile/desktop, use io.File
        if (file is io.File) {
          return Image.file(
            file,
            fit: fit,
            color: overlayColor,
          );
        }
      }
    }
    return Container();
  }

  // Function to build the asset image widget
  Widget _buildAssetImage() {
    if (image.isNotEmpty) {
      return Image(
        fit: fit,
        image: AssetImage(image),
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }
}
