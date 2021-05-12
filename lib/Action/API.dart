import 'dart:async';

import "package:http/http.dart" as http;
import 'package:internship_assignment/Models/UserPost.dart';

const baseUrl="https://jsonplaceholder.typicode.com";

class API{

  static Future getUser(){

    var url=baseUrl +"/users/";

    return http.get(url);
  }


   static Future getPost(int id){

    var url=baseUrl +"/users/$id/posts";

    return http.get(url);
  }



   static Future getPostComments(int id){

    var url=baseUrl +"/posts/$id/comments";

    return http.get(url);
  }


  
}




