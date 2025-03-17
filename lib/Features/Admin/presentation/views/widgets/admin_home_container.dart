import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';

import '../../../../../Core/functions/capitalize.dart';
import '../../../../../Core/utils/size_config.dart';

class AdminHomeContainer extends StatelessWidget {
  const AdminHomeContainer({
    super.key,
    required this.menuItems,
    required this.title,
  });

  final String title;
  final List<FocusedMenuItem> menuItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: FocusedMenuHolder(
        onPressed: () {},
        openWithTap: true,
        animateMenuItems: true,
        menuWidth: SizeConfig.screenWidth * 0.7,
        menuOffset: 10.0,
        menuItemExtent: 50,
        blurSize: 1,
        menuBoxDecoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        menuItems: menuItems,
        child: SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [darkBlue, Color.fromARGB(255, 0, 28, 51)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: darkBlue,
                  offset: Offset(3, 3),
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  capitalize(title),
                  style: Styles.textStyle20,
                ),
                const Icon(Icons.keyboard_arrow_down, size: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
