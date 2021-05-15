import 'dart:async';
import 'dart:convert';
import '../Models/UserAlbums.dart';
import '../Models/User.dart';
import '../Action/API.dart';
import 'package:flutter/material.dart';
import '../Components/UserPostDetail.dart';
import '../Models/UserPhotos.dart';
import 'package:http/http.dart' as http;

class UserPhotosList extends StatefulWidget {
  int id;

  

  UserPhotosList({Key key, this.id});
  @override
  _UserPhotosList createState() => _UserPhotosList();


}

class _UserPhotosList extends State<UserPhotosList> {

  
  Color _iconColor = Colors.blue;

  var photos = new List<UserPhotos>();
  

  _getPhotos() {
    API.getPhotos(widget.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        photos = list.map((model) => UserPhotos.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getPhotos();
  }

  dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
        child: new Scaffold(
            backgroundColor: Colors.cyanAccent.shade400,
            appBar: AppBar(
                toolbarHeight: 60,
                backgroundColor: Colors.blueAccent,
                title: Text("Photos"),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(55))),
                leading: GestureDetector(child: Icon(Icons.person))),
            body: ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    title: Image.network(photos[index].url),
                    // leading: Icon(Icons.person, color: _iconColor),
                    onTap: () {
                      setState(() {
                        _iconColor:
                        Colors.green;
                      });

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) =>
                      //           UserPostDetail(id: album[index].id),
                      //     ));
                    },
                  ),
                );
              },
            )));
  }
}
