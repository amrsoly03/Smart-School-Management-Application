import 'package:equatable/equatable.dart';

class AdminModel extends Equatable {
  final int? adminId;
  final String? name;
  final String? adminPassword;
  final String? email;

  const AdminModel({
    this.adminId,
    this.name,
    this.adminPassword,
    this.email,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        adminId: json['admin_id'] as int?,
        name: json['name'] as String?,
        adminPassword: json['admin_password'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'admin_id': adminId,
        'name': name,
        'admin_password': adminPassword,
        'email': email,
      };

  @override
  List<Object?> get props => [adminId, name, adminPassword, email];
}
