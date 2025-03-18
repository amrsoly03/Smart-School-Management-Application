import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/styles.dart';

import '../functions/capitalize.dart';
import '../utils/size_config.dart';
import '../utils/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.canPop = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.screenHeight * 0.06);

  final String title;
  final List<Widget>? actions;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: darkBlue,
      elevation: 0,
      centerTitle: true,
      title: Text(
        capitalize(title),
        style: Styles.textStyle25,
      ),
      actions: actions,
      leading: canPop
          ? IconButton(
              onPressed: GoRouter.of(context).pop,
              icon: Icon(Icons.arrow_back_ios_new),
            )
          : null,
    );
  }
}
