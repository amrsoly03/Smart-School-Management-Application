// import 'package:flutter/material.dart';
// import 'package:nexura/Screens/student_page.dart';

// import '../../../../Core/widgets/custom_appBar.dart';

// class StudentLogin extends StatelessWidget {
//   const StudentLogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(title: 'Student'),
//       backgroundColor: const Color(0xffD6E7EE),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 200),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Simulating curved text
//                 const Padding(
//                   padding: EdgeInsets.only(right: 150),
//                   child: Text(
//                     'Login to your Account',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xff014479),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 // Email TextField
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Password TextField
//                 TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 // Log In Button
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         PageRouteBuilder(
//                           transitionDuration: const Duration(milliseconds: 500),
//                           pageBuilder:
//                               (context, animation, secondaryAnimation) =>
//                                   const StudentPage(),
//                           transitionsBuilder:
//                               (context, animation, secondaryAnimation, child) {
//                             // هنا نحدد نوع الحركة مثلا Slide
//                             const begin = Offset(1.0, 0.0); // من اليمين
//                             const end = Offset.zero;
//                             const curve = Curves.ease;

//                             final tween = Tween(begin: begin, end: end)
//                                 .chain(CurveTween(curve: curve));
//                             final offsetAnimation = animation.drive(tween);

//                             return SlideTransition(
//                               position: offsetAnimation,
//                               child: child,
//                             );
//                           },
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xff014479),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'Login',
//                       style: TextStyle(fontSize: 22, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
