// pending_item_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import 'pending item_model.dart';

class PendingItemRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PendingItem>> fetchPendingItems() async {
    try {
      final querySnapshot = await _firestore
          .collection('pending_items')
          .orderBy('createdAt', descending: true)
          .get();
      return querySnapshot.docs
          .map((doc) => PendingItem.fromSnapshot(doc))
          .toList();
    } catch (e) {
      throw Exception('Error fetching pending items: $e');
    }
  }

  Future<void> approveItem(PendingItem item) async {
    // Implement approval logic
  }

  Future<void> rejectItem(String itemId) async {
    // Implement rejection logic
  }
}
