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

    return Scaffold(backgroundColor: Colors.amber.shade100,
    appBar: AppBar(
      toolbarHeight: 60, 
     backgroundColor: Colors.blueAccent,
      title:Text("Comments"),
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.vertical(bottom:Radius.circular(55))
      ),
      leading:GestureDetector(child:Icon(Icons.book))

     
       
    ),
      

      body:ListView.builder(


        itemCount:comments.length,
        itemBuilder:(context,index){

        return  
          Container(

            
            margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(

      border: Border.all(color: Colors.blueAccent),
      borderRadius: BorderRadius.all(Radius.circular(20))
    ),

     child:     ListTile(title: Text(("Name: "+comments[index].name)+"\n"+"Email: "+( comments[index].email)),
     
     subtitle: Text((comments[index].body),
     ),

          ),
          );
        }
      )



    );







  }
}