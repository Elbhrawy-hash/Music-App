import 'package:flutter/material.dart';
import 'package:music_app/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int index = 1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index, 
        onTap: (value) {
          setState(() {
            index = value; 
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color(0xff261F44),
        selectedItemColor:Colors.purple,
        unselectedItemColor: Colors.white,
        items: [
          for (int i = 0; i < HomeController.naveBareIcons.length; i++)
            BottomNavigationBarItem(
              icon: HomeController.naveBareIcons[i],
              label: "",
            )
        ],
      ),
      body: HomeController.homescrenns[index],
    );
  }
}