import 'dart:async';
import 'dart:convert';

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

  static Future getAlbum(int id){

    var url=baseUrl +"/users/$id/albums";

    return http.get(url);
  }

 static Future getPhotos(int id){

    var url=baseUrl +"/albums/$id/photos";

    return http.get(url);
  }


fetchData({String url}) async{

  final fetchUrl=Uri.encodeFull(url);
  final headers={"Accept":"application/json"};
  final response=await http.get(fetchUrl,headers:headers);

  if(response.statusCode!=200){

    throw "Error in receieving data";

  }

  JsonDecoder _decoder=new JsonDecoder();
  return _decoder.convert(response.body);

}
  
}




