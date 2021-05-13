import  'dart:async';
import 'dart:convert';
import 'dart:html';


import "../Models/User.dart";
import "../Action/API.dart";
import 'package:flutter/material.dart';
import 'UserPostDetail.dart';
import 'package:http/http.dart' as http;


class ListingUser extends StatefulWidget{


  @override
  _ListingUser createState() => _ListingUser();
}
 

class _ListingUser extends State<ListingUser> {
 


  Color color;
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
       color=Colors.transparent;


    }

    dispose(){

      super.dispose();
    }


Widget build(BuildContext context){
 


return Scaffold(
backgroundColor: Colors.cyanAccent.shade400,
    appBar: AppBar(
      toolbarHeight: 60, 
     backgroundColor: Colors.blueAccent,
      title:Text("User Lists"),
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.vertical(bottom:Radius.circular(55))
      ),
      leading:GestureDetector(child:Icon(Icons.person))

     
       
    ),


body:ListView.builder(
  itemCount: users.length,
  itemBuilder: (context ,index){


    return Container(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(

      border: Border.all(color: Colors.blueAccent),
      borderRadius: BorderRadius.all(Radius.circular(20))
    ),

    

    
   child:  ListTile(title:Text(users[index].name),
    
    onTap: (){

setState(() {
    color=Colors.cyanAccent;
    
    
});
      Navigator.push(context, MaterialPageRoute(builder:(context)=> UserPostDetail(id:users[index].id),
     
      
      ));
    },
    ),


    );


   
  },
  
  )
  


);

}
}