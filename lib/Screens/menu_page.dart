import 'package:flutter/material.dart';
// import 'package:nexura/screens/your_wallet_page.dart';

import '../Core/utils/theme.dart';
import '../Core/widgets/custom_appbar_two.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet App UI',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<MenuPage> {
  bool _isMenuOpen = true; // Initially set to true to show the menu

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: const CustomAppbarTwo(
              title: 'Your Wallet',
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: darkBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Name : Ahmed Mohamed",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "ID : 2025033",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "10,000 EGP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.wallet_sharp,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                  label: '',
                ),
              ],
              backgroundColor: darkBlue,
            )),
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isMenuOpen ? MediaQuery.of(context).size.width * 0.7 : 0,
            color: darkBlue,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isMenuOpen = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isMenuOpen = false;
                          // Navigate to Your Wallet screen if needed
                        });
                      },
                      child: const Text(
                        'Your Wallet',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isMenuOpen = false;
                          // Navigate to Your Purchases screen
                        });
                      },
                      child: const Text(
                        'Your Purchases',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isMenuOpen = false;
                          // Navigate to Payment screen
                        });
                      },
                      child: const Text(
                        'Payment',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isMenuOpen = false;
                          // Navigate to Previous transactions screen
                        });
                      },
                      child: const Text(
                        'Previous transactions',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
