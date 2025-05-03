import 'package:flutter/widgets.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/utils/size_config.dart';
import 'package:nexura/Core/utils/styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  final String title;
  final String image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.screenWidth * 0.9,
        height: SizeConfig.screenHeight * 0.17,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 0, 35, 63),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            capitalize(title),
            style: Styles.textStyle25.copyWith(
              fontSize: 35,
            ),
          ),
        ),
      ),
    );
  }
}
