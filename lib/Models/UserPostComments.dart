import 'dart:convert';

class UserPostComments{


  int post_id;
  int id;
  String name;
  String email;
  String body;

  UserPostComments(int post_id, int id, String name, String email, String body){


    this.post_id=post_id;
    this.id=id;
    this.name=name;
    this.email=email;
    this.body=body;
  }
  
  UserPostComments.fromJson(Map json): 

  post_id=json['post_id'],
  id=json['id'],
  name=json['name'],
  email=json['email'],
  body=json['body'];

  Map toJson(){

    return {'post_id':post_id,"id":id, "name":name, "email":email,"body":body};
  }


  
  
  
  
  
  
  
}