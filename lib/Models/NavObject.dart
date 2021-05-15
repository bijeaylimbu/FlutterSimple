import "package:flutter/material.dart";
import 'package:internship_assignment/BottomNav/Todo.dart';
import 'package:internship_assignment/BottomNav/UserName.dart';
import 'package:internship_assignment/Components/ListingUser.dart';

class NavObject{


  Widget screen;

  Icon navIcon;
  Text title;

  NavObject({this.screen, this.navIcon,this.title});
}


List<NavObject> navItems=[

  NavObject(screen:ListingUser(),
  navIcon: Icon(Icons.person),
  title: Text("Posts")
  
  
  ),

  NavObject(screen:UserName(),
  navIcon: Icon(Icons.person),
  title: Text("Album")
  
  ),

   NavObject(screen:Todo(),
  navIcon: Icon(Icons.list),
  title: Text("Todo")
  
  
  ),







];