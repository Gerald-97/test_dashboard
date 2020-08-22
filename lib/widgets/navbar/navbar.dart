import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar {
  static List<BottomNavigationBarItem> getNavBarList() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text("Home"),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.swap_horiz),
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text("Request Money"),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text("Settings"),
        ),
      ),
    ];
  }
}

class NavBarBorder extends StatelessWidget {
  final BottomNavigationBar bottomNavBar;

  NavBarBorder({@required this.bottomNavBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: bottomNavBar,
      ),
    );
  }
}
