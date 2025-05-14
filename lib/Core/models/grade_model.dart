import 'package:equatable/equatable.dart';

class GradeModel extends Equatable {
  final int? gradeId;
  final int? grade;
  final int? fees;

  const GradeModel({this.gradeId, this.grade, this.fees});

  factory GradeModel.fromJson(Map<String, dynamic> json) => GradeModel(
        gradeId: json['grade_id'] as int?,
        grade: json['grade'] as int?,
        fees: json['fees'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'grade_id': gradeId,
        'grade': grade,
        'fees': fees,
      };

  @override
  List<Object?> get props => [gradeId, grade, fees];
}
