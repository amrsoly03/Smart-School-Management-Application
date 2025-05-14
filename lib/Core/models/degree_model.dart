import 'package:equatable/equatable.dart';

class DegreeModel extends Equatable {
  final int? degreeId;
  final int? subjectDegree;
  final int? stdDegree;
  final int? finalDegree;
  final int? mid;
  final int? practical;

  const DegreeModel({
    this.degreeId,
    this.subjectDegree,
    this.stdDegree,
    this.finalDegree,
    this.mid,
    this.practical,
  });

  factory DegreeModel.fromJson(Map<String, dynamic> json) => DegreeModel(
        degreeId: json['degree_id'] as int?,
        subjectDegree: json['subject_degree'] as int?,
        stdDegree: json['std_degree'] as int?,
        finalDegree: json['final'] as int?,
        mid: json['mid'] as int?,
        practical: json['practical'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'degree_id': degreeId,
        'subject_degree': subjectDegree,
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
      stdDegree,
      finalDegree,
      mid,
      practical,
    ];
  }
}
