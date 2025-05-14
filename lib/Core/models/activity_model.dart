import 'package:equatable/equatable.dart';

class ActivityModel extends Equatable {
  final int? activityId;
  final String? name;
  final String? description;
  final String? image;

  const ActivityModel({
    this.activityId,
    this.name,
    this.description,
    this.image,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        activityId: json['activity_id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'activity_id': activityId,
        'name': name,
        'description': description,
        'image': image,
      };

  @override
  List<Object?> get props => [activityId, name, description, image];
}
