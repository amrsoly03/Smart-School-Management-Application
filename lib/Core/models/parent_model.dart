import 'package:equatable/equatable.dart';

class ParentModel extends Equatable {
  final int? parentId;
  final String? parentPassword;
  final String? email;
  final int? coins;
  final int? feesPaid;
  final int? studentId;
  final String? sName;

  const ParentModel({
    this.parentId,
    this.parentPassword,
    this.email,
    this.coins,
    this.feesPaid,
    this.studentId,
    this.sName,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) => ParentModel(
        parentId: json['parent_id'] as int?,
        parentPassword: json['parent_password'] as String?,
        email: json['email'] as String?,
        coins: json['coins'] as int?,
        feesPaid: json['fees_paid'] as int?,
        studentId: json['student_id'] as int?,
        sName: json['s_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'parent_id': parentId,
        'parent_password': parentPassword,
        'email': email,
        'coins': coins,
        'fees_paid': feesPaid,
        'student_id': studentId,
        's_name': sName,
      };

  @override
  List<Object?> get props {
    return [
      parentId,
      parentPassword,
      email,
      coins,
      feesPaid,
      studentId,
      sName,
    ];
  }
}
