import 'package:flutter/material.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/utils/theme.dart';
import 'create_account_form.dart';

class CreateAccountViewBody extends StatelessWidget {
  const CreateAccountViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'create account'),
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
                  capitalize('create new account'),
                  style: Styles.textStyle18.copyWith(color: darkBlue),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            CreateAccountForm(),
          ],
        )),
      ),
    );
  }
}
