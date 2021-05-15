import 'dart:async';
import 'dart:convert';
import "../Models/UserAlbums.dart";
import '../Models/User.dart';
import '../Action/API.dart';
import "../BottomNav/UserPhotosList.dart";
import 'package:flutter/material.dart';
import '../Components/UserPostDetail.dart';
import 'package:http/http.dart' as http;

class AlbumsLists extends StatefulWidget {
  int id;

  AlbumsLists({Key key, this.id});
  @override
  _AlbumsLists createState() => _AlbumsLists();
}

class _AlbumsLists extends State<AlbumsLists> {

  
  Color _iconColor = Colors.blue;

  var album = new List<UserAlbums>();
  

  _getAlbum() {
    API.getAlbum(widget.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        album = list.map((model) => UserAlbums.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAlbum();
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
                title: Text("Album List"),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(55))),
                leading: GestureDetector(child: Icon(Icons.person))),
            body: ListView.builder(
              itemCount: album.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    title: Text(album[index].title),
                    leading: Icon(Icons.book, color: _iconColor),
                    onTap: () {
                      setState(() {
                        _iconColor:
                        Colors.green;
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UserPhotosList(id: album[index].id),
                          ));
                    },
                  ),
                );
              },
            )));
  }
}
