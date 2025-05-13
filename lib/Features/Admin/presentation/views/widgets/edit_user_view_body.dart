import 'package:flutter/material.dart';
import 'package:nexura/Features/Admin/presentation/views/widgets/edit_user_form.dart';

import '../../../../../Core/functions/capitalize.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/utils/theme.dart';
import '../../../../../Core/widgets/custom_appBar.dart';

class EditUserViewBody extends StatelessWidget {
  const EditUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'edit account'),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              width: double.infinity,
              //child: Image.asset('assets/images/gym _logo.png', color: white),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  capitalize('edit user account'),
                  style: Styles.textStyle18.copyWith(color: darkBlue),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            EditUserForm(),
          ],
        )),
      ),
    );
  }
}
