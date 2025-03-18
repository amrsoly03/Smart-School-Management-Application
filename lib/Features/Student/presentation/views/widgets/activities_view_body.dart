import 'package:flutter/material.dart';

import '../../../../../Core/widgets/custom_appBar.dart';
import 'custom_container.dart';

class ActivitiesViewBody extends StatelessWidget {
  const ActivitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'activities'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomContainer(
              title: 'football',
              image: 'assets/football.jpg',
            ),
            CustomContainer(
              title: 'padel',
              image: 'assets/padel.jpg',
            ),
            CustomContainer(
              title: 'basketball',
              image: 'assets/basketball.jpg',
            ),
          ],
        ),
      ),
    );
  }
}