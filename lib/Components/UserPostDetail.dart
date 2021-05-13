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
      backgroundColor: Colors.deepOrange.shade100,
    appBar: AppBar(
      toolbarHeight: 60, 
     backgroundColor: Colors.blueAccent,
      title:Text("Post"),
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.vertical(bottom:Radius.circular(55))
      ),
      leading:GestureDetector(child:Icon(Icons.book))

     
       
    ),

      body:ListView.builder(

        itemCount: posts.length,
        itemBuilder: (context,index){

          return
          Container(
            margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(

      border: Border.all(color: Colors.blueAccent),
      borderRadius: BorderRadius.all(Radius.circular(20))
    ),
          
          
       child:    ListTile(title:Text("Title:      "+posts[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
       subtitle: Text(posts[index].body),
       
          onTap: (){



      Navigator.push(context, MaterialPageRoute(builder:(context)=> PostComments(id:posts[index].id),
   
      ));
    },
          
          
          ),
          );
          
        },
      )








    );
  }


  
}