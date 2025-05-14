import 'package:equatable/equatable.dart';

class StudentModel extends Equatable {
  final int? studentId;
  final String? sName;
  final String? studentPassword;
  final int? grade;
  final int? sParentId;
  final String? email;

  const StudentModel({
    this.studentId,
    this.sName,
    this.studentPassword,
    this.grade,
    this.sParentId,
    this.email,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        studentId: json['student_id'] as int?,
        sName: json['s_name'] as String?,
        studentPassword: json['student_password'] as String?,
        grade: json['grade'] as int?,
        sParentId: json['s_parent_id'] as int?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'student_id': studentId,
        's_name': sName,
        'student_password': studentPassword,
        'grade': grade,
        's_parent_id': sParentId,
        'email': email,
      };

  @override
  List<Object?> get props {
    return [
      studentId,
      sName,
      studentPassword,
      grade,
      sParentId,
      email,
    ];
  }
}
