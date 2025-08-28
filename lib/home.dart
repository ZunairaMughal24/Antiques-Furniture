import 'package:antiques_furniture/features/cart/presentation/screens/cart_screen.dart';
import 'package:antiques_furniture/features/categories/presentation/screens/categories_screen.dart';
import 'package:antiques_furniture/features/home/presentation/screens/home_screen.dart';
import 'package:antiques_furniture/widgets/navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    CategoryScreen(),
    CartScreen(),

    const Center(child: Text("Profile Page", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
