import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:mychat/main_page/chats_Page.dart';
import 'package:mychat/main_page/groups_page.dart';
import 'package:mychat/main_page/people_page.dart';
import 'package:mychat/utily/assets_manager.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key, this.savedThemeMode});
    final AdaptiveThemeMode? savedThemeMode;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  final List<Widget> pages = const <Widget>[
    ChatsPage(),
    PeoplePage(),
    GroupsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('My Chat App Pro'),
          actions: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AssetsManager.nopi),
              
            ),       
            
             ],
        ),
      
      body: Center(
        child: PageView(
          children: <Widget>[
           pages[currentIndex],
          ],
          controller: pageController,
        ),
      ),  
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Groups',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), 
              curve: Curves.ease); 
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
      )

    );
  }
}