import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Features/Admin/presentation/views/widgets/admin_sent_report_card.dart';
import 'package:nexura/Features/Parent/presentation/manager/parent_cubit/parent_cubit.dart';

import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_appBar.dart';

class ParentSentReportsViewBody extends StatelessWidget {
  const ParentSentReportsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sent Report'),
      body: BlocBuilder<ParentCubit, ParentState>(
        builder: (context, state) {
          if (state is ParentFailure) {
            return Center(
                child: Text(
              state.errMessage,
              style: Styles.textStyle20.copyWith(color: darkBlue),
            ));
          } else if(state is ViewSentReportsSuccess){
            return ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: state.reports.length,
              itemBuilder: (context, index) {
                return AdminSentReportCard(
                  senderName: 'Admin',
                  reportContent: state.reports[index].content!,
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: darkBlue,
              ),
            );
          }
        },
      ),
    );
  }
}
