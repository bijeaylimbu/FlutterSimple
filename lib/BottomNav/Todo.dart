


import "../Models/Todo.dart";

import 'package:flutter/material.dart';




class _strikeThrough extends StatelessWidget{

  final String todoText;
  final bool todoCheck;
  _strikeThrough(this.todoText, this.todoCheck) : super();

  Widget _widget(){
    if(todoCheck){
      return Text(
        todoText,
        style: TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
          fontSize: 22.0,
          color: Colors.red[200],
        ),
      );
    }
    else{
      return Text(
        todoText,
        style: TextStyle(
          fontSize: 22.0
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return _widget();
  }
}

class TodoScreen extends StatefulWidget{

  @override
  _TodoScreen createState(){
    return _TodoScreen();
  }
}

class _TodoScreen extends State<TodoScreen>{

   final List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: ListView(children: _getItems()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(context),
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTodoItem(String title) {
    //Wrapping it inside a set state will notify
    // the app that the state has changed

    setState(() {
      _todoList.add(title);
    });
    _textFieldController.clear();
  }

  //Generate list of item widgets
  Widget _buildTodoItem(String title) {
    return ListTile(
      title: Text(title),
    );
  }

  //Generate a single item widget
  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your List'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              ),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }
}



