import 'package:equatable/equatable.dart';

class DegreeModel extends Equatable {
  final int? degreeId;
  final int? subjectDegree;
  final String? subjectDegreeName;
  final int? stdDegree;
  final int? finalDegree;
  final int? mid;
  final int? practical;

  const DegreeModel({
    this.degreeId,
    this.subjectDegree,
    this.subjectDegreeName,
    this.stdDegree,
    this.finalDegree,
    this.mid,
    this.practical,
  });

  factory DegreeModel.fromJson(Map<String, dynamic> json) => DegreeModel(
        degreeId: json['degree_id'] as int?,
        subjectDegree: json['subject_degree'] as int?,
        subjectDegreeName: json['subject_degree_name'] as String?,
        stdDegree: json['std_degree'] as int?,
        finalDegree: json['final'] as int?,
        mid: json['mid'] as int?,
        practical: json['practical'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'degree_id': degreeId,
        'subject_degree': subjectDegree,
        'subject_degree_name': subjectDegreeName,
        'std_degree': stdDegree,
        'final': finalDegree,
        'mid': mid,
        'practical': practical,
      };

  @override
  List<Object?> get props {
    return [
      degreeId,
      subjectDegree,
      subjectDegreeName,
      stdDegree,
      finalDegree,
      mid,
      practical,
    ];
  }
}
