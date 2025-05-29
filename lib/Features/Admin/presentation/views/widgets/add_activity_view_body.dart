import 'package:flutter/material.dart';

import '../../../../../Core/widgets/custom_appBar.dart';
import 'add_activity_form.dart';

class AddActivityViewBody extends StatelessWidget {
  const AddActivityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'add activity'),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     child: Text(
            //       capitalize('add new product'),
            //       style: Styles.textStyle18.copyWith(color: darkBlue),
            //       textAlign: TextAlign.start,
            //     ),
            //   ),
            // ),

            AddActivityForm(),
          ],
        )),
      ),
    );
  }
}
