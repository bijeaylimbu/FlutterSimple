import 'package:flutter/material.dart';
import 'package:internship_assignment/Models/NavObject.dart';

class BottomNavbar extends StatefulWidget{

  @override
  _BottomNavBar createState()=> _BottomNavBar();

}


class _BottomNavBar extends State<BottomNavbar> {
  int _screenNumber=0;

@override
Widget build(BuildContext context) {
  return Scaffold(


    body: navItems[_screenNumber].screen,
    bottomNavigationBar: BottomNavigationBar(

      type:BottomNavigationBarType.fixed,
      items: navItems.map((navItem) => BottomNavigationBarItem(
        
        icon: navItem.navIcon,
        title: navItem.title
        
        
        
        )).toList(),

        currentIndex: _screenNumber,
        onTap: (i)=> setState((){

          _screenNumber=i;



        }),




    ),
  ) ;
}

}


