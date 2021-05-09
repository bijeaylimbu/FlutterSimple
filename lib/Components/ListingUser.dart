import  'dart:async';
import 'dart:convert';
import 'dart:html';


import "../Models/User.dart";
import "../Action/API.dart";
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListingUser extends StatefulWidget{

  
  @override
  _ListingUser createState() => _ListingUser();
}
 






class _ListingUser extends State<ListingUser> {
var users=new List<User> ();

_getUser(){

  API.getUser().then((response){


    setState(() {
      Iterable list=json.decode(response.body);
      users=list.map((model)=>User.fromJson(model)).toList();
    });
  });
}

 
    @override
    void initState(){

       super.initState();
       _getUser();


    }

    dispose(){

      super.dispose();
    }







Widget build(BuildContext context){


return Scaffold(


  


    appBar: AppBar(

      title: Text("Users"),
    ),


body:ListView.builder(
  itemCount: users.length,
  itemBuilder: (context ,index){


    return ListTile(title:Text(users[index].name));

   
  },
  
  )



    


);

}
}