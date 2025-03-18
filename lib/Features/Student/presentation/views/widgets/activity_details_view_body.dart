import 'package:flutter/material.dart';
import 'package:nexura/Core/functions/capitalize.dart';
import 'package:nexura/Core/utils/size_config.dart';
import 'package:nexura/Core/utils/styles.dart';
import 'package:nexura/Core/utils/theme.dart';

class ActivityDetailsViewBody extends StatelessWidget {
  const ActivityDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image(
                  image: const AssetImage('assets/football.jpg'),
                  width: double.infinity,
                  height: SizeConfig.screenHeight * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      capitalize('informations:'),
                      style: Styles.textStyle25.copyWith(
                        color: darkBlue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      capitalize(
                          'A football training subscription for kids in school can provide structured, age-appropriate development of fundamental skills, physical fitness, and teamwork. Programs like NFL FLAG-In-Schools offer curriculum and equipment for non-contact flag football, emphasizing safety and inclusivity. Alternatively, schools can partner with local youth football organizations or coaches offering after-school programs. These subscriptions often include weekly training sessions, skill-building drills, and sometimes even mini-games. When evaluating options, consider the programs focus on skill development versus competitive play, the coach-to-student ratio, safety protocols, and the overall cost'),
                      style: Styles.textStyle14.copyWith(
                        color: darkBlue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        capitalize('Date: 12/12/2025'),
                        textAlign: TextAlign.center,
                        style: Styles.textStyle20.copyWith(
                          color: darkBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: SizeConfig.screenWidth / 1.25,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: darkBlue,
            child: Text(
              capitalize('subscribe'),
              style: Styles.textStyle18,
            ),
          ),
          
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
