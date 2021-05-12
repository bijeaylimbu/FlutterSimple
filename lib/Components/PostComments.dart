import 'dart:convert';

import "package:flutter/material.dart";
import 'package:internship_assignment/Action/API.dart';
import 'package:internship_assignment/Models/UserPostComments.dart';


class PostComments extends StatefulWidget{
  int id;
  PostComments({Key key, this.id});

  @override
 _PostComments createState()=> _PostComments();
}

class _PostComments extends State<PostComments>{

  var comments=new List<UserPostComments>();
  getComments(){


    API.getPostComments(widget.id).then((response){

      setState(() {
        Iterable list=json.decode(response.body);
        comments=list.map((model)=> UserPostComments.fromJson(model)).toList();
        
      });



    });
  }
  
  void initState(){

    super.initState();
    getComments();
  }

  void dispose(){

    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      body:ListView.builder(


        itemCount:comments.length,
        itemBuilder:(context,index){

          return ListTile(title: Text(comments[index].body));
        }
      )



    );







  }
}