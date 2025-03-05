import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_admin_panel_flutter/Utils/exceptions/firebase_exceptions.dart';
import 'package:echo_admin_panel_flutter/data/repositories/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/exceptions/firebase_auth_exceptions.dart';
import '../../../Utils/exceptions/format_excptions.dart';
import '../../../Utils/exceptions/platform_exceptions.dart';
import '../authentication/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get Instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Function to save user data to Firebase.

  Future<void> createUser(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw EFormatException('Invalid format');
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserModel> fetchAdminDetails() async {
    try {
      final docSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      return UserModel.fromSnapshot(docSnapshot);
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw EFormatException('Invalid format');
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
