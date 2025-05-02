// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import 'widgets/admin_login_view_body.dart';

class AdminLoginView extends StatelessWidget {
  AdminLoginView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AdminLoginViewBody();
  }
}
