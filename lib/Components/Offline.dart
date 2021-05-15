import 'dart:convert';

import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:hive_flutter/hive_flutter.dart";
import 'package:path_provider/path_provider.dart';
import "package:http/http.dart" as http;
class OfflineData extends StatefulWidget{


@override
_OfflineData createState()=> _OfflineData();


}

class _OfflineData extends State<OfflineData> {
Box box;
List data=[];

Future openBox() async{

  var dir=await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  box=await Hive.openBox("data");
  return ;

}


Future<bool> getAppData() async{

  await openBox();

  String url="jsonplaceholder.typicode.com/users/";

  try{
    var response=await http.get(url);
    var _jsonDecode=jsonDecode(response.body);
    await putData(_jsonDecode);






    
  } catch(SocketException){
    print("no internet connection");


  }

  var mymap=box.toMap().values.toList();

  if(mymap.isEmpty){

    data.add('empty');




  }else{
    data=mymap;


  }

  return Future.value(true);
}


 Future putData(data) async{

   await box.clear();
   //insert data

   for( var d in data) {

     box.add(d);
   }
 }


  @override
  Widget build(BuildContext context){

return Scaffold(


  body:Center(
    child: FutureBuilder(


      future: getAppData(),
      builder: (context,snapshot){

        if(snapshot.hasData){
          if(data.contains("empty")){

            return Text("nO data");
          }else{

            return Column(children: <Widget>[

              Expanded(child:ListView.builder(
                itemCount: data.length,

                itemBuilder: (ctxt,index){
                  return 
                  
                  
                  
                  ListTile(title:Text(data[index].name));



                }


              ))
            ],);


          }


        }
        else(Exception e){

          return Text(e.toString());
        };
      },
    ),


  ),
);

  }
}