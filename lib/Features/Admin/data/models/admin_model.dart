import 'package:equatable/equatable.dart';

class AdminModel extends Equatable {
  final int? adminId;
  final String? type;
  final String? name;
  final String? adminPassword;
  final String? email;

  const AdminModel({
    this.adminId,
    this.type,
    this.name,
    this.adminPassword,
    this.email,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        adminId: json['admin_id'] as int?,
        type: json['type'] as String?,
        name: json['name'] as String?,
        adminPassword: json['admin_password'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'admin_id': adminId,
        'type': type,
        'name': name,
        'admin_password': adminPassword,
        'email': email,
      };

  @override
  List<Object?> get props => [adminId, type, name, adminPassword, email];
}
