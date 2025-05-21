import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexura/Core/utils/theme.dart';
import 'package:nexura/Features/Admin/presentation/manager/admin_cubit/admin_cubit.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import 'admin_sent_report_card.dart';

class SentReportsViewBody extends StatelessWidget {
  const SentReportsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sent Report'),
      body: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          if (state is ViewSentReportsSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: state.reports.length,
              itemBuilder: (context, index) {
                return AdminSentReportCard(
                  senderName: state.reports[index].sName!,
                  reportContent: state.reports[index].content!,
                );
              },
            );
          } else if (state is AdminFailure) {
            return Center(
              child: Text(
                state.errMessage,
                style: Styles.textStyle20.copyWith(
                  color: darkBlue,
                ),
              ),
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
