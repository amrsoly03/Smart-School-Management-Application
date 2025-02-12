// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:nexura/Features/Parent/presentation/views/widgets/parent_login_view_body.dart';

class ParentLoginView extends StatelessWidget {
  ParentLoginView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ParentLoginViewBody();
  }
}
