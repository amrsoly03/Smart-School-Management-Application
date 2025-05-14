import 'package:flutter/material.dart';

import '../utils/size_config.dart';
import '../utils/theme.dart';

Future<dynamic> CustomBottomSheet(BuildContext context, Widget widget) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    //showDragHandle: true,
    builder: (BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: SizeConfig.screenHeight * 0.5,
        width: SizeConfig.screenWidth * 0.90,
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: widget,
      );
    },
  );
}
