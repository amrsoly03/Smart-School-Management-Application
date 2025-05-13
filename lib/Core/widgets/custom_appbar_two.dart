import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/screens/menu_page.dart';

import '../functions/capitalize.dart';
import '../utils/size_config.dart';
import '../utils/theme.dart';

class CustomAppbarTwo extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbarTwo({
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
      actions: [
        ...?actions,
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // هنا يمكنك فتح صفحة القائمة مثلاً
            // GoRouter.of(context).push('/menu');
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const MenuPage()));
          },
        ),
      ],
      leading: canPop
          ? IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios_new),
            )
          : null,
    );
  }
}
