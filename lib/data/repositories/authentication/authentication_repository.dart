import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/exceptions/firebase_auth_exceptions.dart';
import '../../../Utils/exceptions/firebase_exceptions.dart';
import '../../../Utils/exceptions/format_excptions.dart';
import '../../../Utils/exceptions/platform_exceptions.dart';
import '../../../routes/route.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Fiebase Auth Intance

  // Firebase Auth Instance
  final _auth = FirebaseAuth.instance;

// Get Authenticated User Data
  User? get authUser => _auth.currentUser;

// Get IsAuthenticated User
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }

  // Function to determine the relevant screen and redirect accordingly.
  void screenRedirect() async {
    final user = _auth.currentUser;

    // If the user is logged in
    if (user != null) {
      // Navigate to the Home
      Get.offAllNamed(ERoutes.dashboard);
    } else {
      Get.offAllNamed(ERoutes.login);
    }
  }

  /// Login

  Future<UserCredential> loginWihtEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
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

  /// REgister

  Future<UserCredential> RegisterEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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

  /// Register user by Admin

  /// Email Verification

  /// Forget Password

  /// Re Authentication User

  /// Logout User
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(ERoutes.login);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FirebaseException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FormatException catch (_) {
      throw FormatException('Invalid format');
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code, message: e.message);
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  /// Delete User
}
