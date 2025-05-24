// pending_table_button.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingActionButton extends StatelessWidget {
  final Function(String) onDeletePressed;
  final VoidCallback onAcceptPressed;
  final TextEditingController _rejectionController = TextEditingController();

  PendingActionButton({
    super.key,
    required this.onDeletePressed,
    required this.onAcceptPressed,
  });

  void _showRejectionDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('Rejection Reason'),
        content: TextField(
          controller: _rejectionController,
          decoration: const InputDecoration(
            hintText: 'Enter reason for rejection...',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final message = _rejectionController.text.trim();
              if (message.isNotEmpty) {
                Get.back();
                onDeletePressed(message);
              }
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.check, color: Colors.green),
          onPressed: onAcceptPressed,
        ),
        IconButton(
          icon: const Icon(Icons.close, color: Colors.red),
          onPressed: () => _showRejectionDialog(context),
        ),
      ],
    );
  }
}