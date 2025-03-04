import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Utils/constants/enums.dart';
import '../../../Utils/formatters/formatter.dart';

class UserModel {
  final String? id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;
  AppRole role;
  DateTime? createdAt;
  DateTime? updatedAt;

  /// Constructor for UserModel.
  UserModel({
    this.id,
    required this.email,
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    this.phoneNumber = '',
    this.profilePicture = '',
    this.role = AppRole.User,
    this.createdAt,
    this.updatedAt,
  });

  /// Heplpe methode
  String get fullname => '$firstName $lastName';
  String get formattedDate => EFormatter.formatDate(createdAt);
  String get formattedUpdatedAtDate => EFormatter.formatDate(updatedAt);
  String get formattedPhoneNo => EFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to create on empty user model
  static UserModel empty() => UserModel(email: '');

  /// Convert model to Json Structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Role': role.name.toString(),
      'CreateAt': createdAt,
      'UpdateAt': updatedAt = DateTime.now(),
    };
  }

  /// Factory methode to create a UseerModel from a FireBase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data.containsKey('FirstName') ? data['FirstName'] ?? '' : '',
        lastName: data.containsKey('LastName') ? data['LastName'] ?? '' : '',
        username: data.containsKey('UserName') ? data['UserName'] ?? '' : '',
        email: data.containsKey('Email') ? data['Email'] ?? '' : '',
        phoneNumber:
            data.containsKey('PhoneNumber') ? data['PhoneNumber'] ?? '' : '',
        profilePicture: data.containsKey('ProfilePicture')
            ? data['ProfilePicture'] ?? ''
            : '',
        role: data.containsKey('Role')
            ? (data['Role'] ?? AppRole.User) == AppRole.admin.name.toString()
                ? AppRole.admin
                : AppRole.User
            : AppRole.User,
        createdAt: data.containsKey('CreatedAt')
            ? (data['CreatedAt'] as Timestamp?)?.toDate() ?? DateTime.now()
            : DateTime.now(),
        updatedAt: data.containsKey('UpdatedAt')
            ? (data['UpdatedAt'] as Timestamp?)?.toDate() ?? DateTime.now()
            : DateTime.now(),
      );
    } else {
      return UserModel.empty();
    }
  }
}
