import 'package:flutter/material.dart';
import 'package:nexura/Core/functions/capitalize.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/widgets/custom_appBar.dart';
import 'login_card.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'admin login'),
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
                  capitalize('login to your account'),
                  style: Styles.textStyle18,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            LoginCard(),
          ],
        )),
      ),
    );
  }
}
