import 'package:equatable/equatable.dart';

class ActivityNotificationModel extends Equatable {
  final int? anId;
  final int? activityAn;
  final String? content;

  const ActivityNotificationModel({
    this.anId,
    this.activityAn,
    this.content,
  });

  factory ActivityNotificationModel.fromJson(Map<String, dynamic> json) {
    return ActivityNotificationModel(
      anId: json['an_id'] as int?,
      activityAn: json['activity_an'] as int?,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'an_id': anId,
        'activity_an': activityAn,
        'content': content,
      };

  @override
  List<Object?> get props => [anId, activityAn, content];
}
