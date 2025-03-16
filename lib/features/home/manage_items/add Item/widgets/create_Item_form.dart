import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/Utils/validators/validation.dart';
import 'package:echo_admin_panel_flutter/common/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/images/i_circularImage.dart';
import '../../../category/create_categort/widgets/image_upload.dart';

class CreateItemForm extends StatefulWidget {
  const CreateItemForm({super.key});

  @override
  State<CreateItemForm> createState() => _CreateItemFormState();
}

class _CreateItemFormState extends State<CreateItemForm> {
  // Dropdown options for Category ID
  final List<String> categoryOptions = [
    'Category 1',
    'Category 2',
    'Category 3'
  ];
  String selectedCategory = 'Category 1';

  // For branch availability
  final List<String> branchOptions = ['Yes', 'No'];
  String branchAvailable = 'Yes';

  // Current date for item creation
  final String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return ERoundedContainer(
      width: 500,
      padding: EdgeInsets.all(ESizes.defaultSpace),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              SizedBox(
                height: ESizes.sm,
              ),

              SizedBox(
                height: ESizes.spaceBtwSections,
              ),

              /// Category ID Dropdown
              Text('Category ID', style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: ESizes.spaceBtwItems / 2),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.category),
                  border: OutlineInputBorder(),
                ),
                items: categoryOptions.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
              ),

              SizedBox(
                height: ESizes.spaceBtwInputFields,
              ),

              /// Item Name
              TextFormField(
                validator: (value) =>
                    EValidator.validateEmptyText('Name', value),
                decoration: InputDecoration(
                  labelText: 'Item Name',
                  prefixIcon: Icon(Iconsax.shopping_cart),
                ),
              ),

              SizedBox(
                height: ESizes.spaceBtwInputFields,
              ),

              /// Tags
              TextFormField(
                validator: (value) =>
                    EValidator.validateEmptyText('Tags', value),
                decoration: InputDecoration(
                  labelText: '# Tags',
                  prefixIcon: Icon(Iconsax.tag),
                ),
              ),

              SizedBox(
                height: ESizes.spaceBtwInputFields,
              ),

              /// Description
              Text('Description', style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: ESizes.spaceBtwItems / 2),
              TextFormField(
                validator: (value) =>
                    EValidator.validateEmptyText('Description', value),
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter item description...',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(
                height: ESizes.spaceBtwInputFields,
              ),

              /// Email
              TextFormField(
                validator: (value) => EValidator.validateEmail(value),
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Iconsax.message),
                ),
              ),

              SizedBox(
                height: ESizes.spaceBtwInputFields,
              ),

              /// Website URL
              TextFormField(
                validator: (value) =>
                    EValidator.validateEmptyText('Website URL', value),
                decoration: InputDecoration(
                  labelText: 'Website URL',
                  prefixIcon: Icon(Iconsax.global),
                ),
              ),

              SizedBox(
                height: ESizes.spaceBtwInputFields,
              ),

              /// Mobile Number
              TextFormField(
                validator: (value) => EValidator.validatePhoneNumber(value),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Iconsax.call),
                ),
              ),

              SizedBox(
                height: ESizes.spaceBtwInputFields,
              ),

              /// Map Location
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Map Location',
                        prefixIcon: Icon(Iconsax.location),
                      ),
                    ),
                  ),
                  SizedBox(width: ESizes.spaceBtwItems),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Iconsax.map),
                      label: Text('Choose'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: ESizes.spaceBtwInputFields * 1.5,
              ),

              /// Profile Image
              Center(
                child: Column(
                  children: [
                    Text('Profile Image',
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: ESizes.spaceBtwItems),
                    EImageUploader(
                      imageType: ImageType.asset,
                      image: EImages.onboardingImage1,
                      width: 80,
                      height: 80,
                      icon: Iconsax.edit_2,
                      onIconButtonPressed: () {},
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: ESizes.spaceBtwInputFields * 1.5,
              ),

              /// Branch Availability
              Text('Branch Available',
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: ESizes.spaceBtwItems / 2),
              DropdownButtonFormField<String>(
                value: branchAvailable,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.building),
                  border: OutlineInputBorder(),
                ),
                items: branchOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    branchAvailable = newValue!;
                  });
                },
              ),

              SizedBox(
                height: ESizes.spaceBtwInputFields,
              ),

              /// Creation Date
              TextFormField(
                readOnly: true,
                initialValue: currentDate,
                decoration: InputDecoration(
                  labelText: 'Creation Date',
                  prefixIcon: Icon(Iconsax.calendar),
                ),
              ),

              SizedBox(
                height: ESizes.spaceBtwSections,
              ),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Create Item'),
                ),
              ),

              SizedBox(
                height: ESizes.spaceBtwInputFields * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
