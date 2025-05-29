import 'package:flutter/widgets.dart';
import 'package:nexura/Core/models/activity_model.dart';
import 'package:nexura/Features/Student/presentation/views/widgets/activity_details_view_body.dart';

class ActivityDetailsView extends StatelessWidget {
  const ActivityDetailsView({super.key, required this.activityModel});

  final ActivityModel activityModel;

  @override
  Widget build(BuildContext context) {
    return ActivityDetailsViewBody(activityModel: activityModel);
  }
}
