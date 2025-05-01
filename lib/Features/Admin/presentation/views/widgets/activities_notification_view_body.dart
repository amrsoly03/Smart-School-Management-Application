import 'package:flutter/material.dart';
import 'package:nexura/Core/widgets/custom_appBar.dart';

// ignore: must_be_immutable
class ActivitiesNotificationViewBody extends StatelessWidget {
  ActivitiesNotificationViewBody({super.key});

  String? selectedActivity;

  final List<String> activities = ['Football', 'Basketball', 'Volleyball'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6E7EE),
      appBar: const CustomAppBar(title: 'Activties Notification'),
      body: Container(
        color: Colors.lightBlue[50],
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff014479),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                isExpanded: true,
                dropdownColor: const Color(0xff014479),
                iconEnabledColor: Colors.white,
                hint: const Text(
                  "Select Activity",
                  style: TextStyle(color: Colors.white),
                ),
                value: selectedActivity,
                onChanged: (value) {
                  // setState(() {
                  //   selectedActivity = value;
                  // });
                },
                items: activities.map((activity) {
                  return DropdownMenuItem<String>(
                    value: activity,
                    child: Text(
                      activity,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          //border: ,
                          hintText: 'enter the notification here',
                        ),
                        maxLines: 25,
                        minLines: 1,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: const Color(0xff014479)),
                        child: const Text(
                          'Send',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
