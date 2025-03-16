import 'package:echo_admin_panel_flutter/Utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CategoryTableHeader extends StatelessWidget {
  const CategoryTableHeader(
      {super.key,
      this.onPressed,
      this.searchController,
      required this.buttonText,
      this.SeaerchOnChanged});

  final Function()? onPressed;
  final TextEditingController? searchController;
  final String buttonText;
  final Function(String)? SeaerchOnChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: !EDeviceUtils.isDesktopScreen(context) ? 3 : 1,
            child: Row(
              children: [
                SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: onPressed, child: Text(buttonText))),
              ],
            )),
        Expanded(
          flex: !EDeviceUtils.isDesktopScreen(context) ? 2 : 1,
          child: TextFormField(
            controller: searchController,
            onChanged: SeaerchOnChanged,
            decoration: const InputDecoration(
              hintText: 'Search hear....',
              prefixIcon: Icon(Iconsax.search_normal),
            ),
          ),
        ),
      ],
    );
  }
}
