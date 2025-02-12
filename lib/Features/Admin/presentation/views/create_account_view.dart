// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import 'widgets/create_account_view_body.dart';

class CreateAccountView extends StatelessWidget {
  CreateAccountView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CreateAccountViewBody();
  }
}
