// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:nexura/first_screen.dart';

import 'widgets/admin_login_card.dart';
import 'widgets/login_view_body.dart';
import 'widgets/parent_login_card.dart';
import 'widgets/student_login_card.dart';

// ignore: must_be_immutable
class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
    required this.user,
  });

  final Users user;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String title = '';
  Widget card = Container();

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() {
    if (widget.user == Users.schoolAdmin) {
      title = 'admin login';
      card = AdminLoginCard(
        type: Users.schoolAdmin.name,
      );
    } else if (widget.user == Users.cafeteriaAdmin) {
      title = 'cafeteria admin login';
      card = AdminLoginCard(
        type: Users.cafeteriaAdmin.name,
      );
    } else if (widget.user == Users.activitiesAdmin) {
      title = 'activities admin login';
      card = AdminLoginCard(
        type: Users.activitiesAdmin.name,
      );
    } else if (widget.user == Users.teacher) {
      title = 'teacher login';
      card = AdminLoginCard(
        type: Users.teacher.name,
      );
    } else if (widget.user == Users.student) {
      title = 'student login';
      card = StudentLoginCard();
    } else if (widget.user == Users.parent) {
      title = 'parent login';
      card = ParentLoginCard();
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LoginViewBody(
      user: widget.user,
      title: title,
      card: card,
    );
  }
}
