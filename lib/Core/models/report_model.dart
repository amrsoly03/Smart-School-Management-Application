import 'package:equatable/equatable.dart';

class ReportModel extends Equatable {
  final int? reportId;
  final int? stdReport;
  final String? content;
  final int? fromAdmin;
  final String? sName;

  const ReportModel({
    this.reportId,
    this.stdReport,
    this.content,
    this.fromAdmin,
    this.sName,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        reportId: json['report_id'] as int?,
        stdReport: json['std_report'] as int?,
        content: json['content'] as String?,
        fromAdmin: json['from_admin'] as int?,
        sName: json['s_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'report_id': reportId,
        'std_report': stdReport,
        'content': content,
        'from_admin': fromAdmin,
        's_name': sName,
      };

  @override
  List<Object?> get props {
    return [
      reportId,
      stdReport,
      content,
      fromAdmin,
      sName,
    ];
  }
}
