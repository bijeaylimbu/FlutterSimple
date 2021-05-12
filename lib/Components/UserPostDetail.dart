import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internship_assignment/Action/API.dart';
import "../Components/PostComments.dart";
import 'package:internship_assignment/Models/UserPost.dart';
import '../Models/User.dart';
class UserPostDetail extends StatefulWidget{

  int id;
  UserPostDetail({Key key, this.id});
 
@override
_UserPostDetail createState()=> _UserPostDetail();
 
}


class _UserPostDetail extends State<UserPostDetail> {
var posts=new List<UserPost>();

getPost(){

  API.getPost(widget.id).then((response){ 

    setState(() {
      Iterable list=json.decode(response.body);
      posts=list.map((model) => UserPost.fromJson(model)).toList();
    });



  });
}
  


 int id;
_UserPostDetail({this.id});

@override
void initState(){

  super.initState();
  getPost();
  
}

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context){

    return Scaffold(

      body:ListView.builder(

        itemCount: posts.length,
        itemBuilder: (context,index){

          return ListTile(title:Text(posts[index].title),
          onTap: (){


      Navigator.push(context, MaterialPageRoute(builder:(context)=> PostComments(id:posts[index].id),
      // settings: RouteSettings(

      //   arguments: users[index]
      // )
      
      ));
    },
          
          
          );
          
        },
      )








    );
  }


  
}