import 'dart:convert';

import 'package:first_app/updatenote.dart';
import 'package:flutter/material.dart';
import 'package:first_app/model.dart';
import 'package:http/http.dart' as http;

import 'createlist.dart';
// import 'api_serivice.dart';

class Details extends StatefulWidget {
  final Note notes;
  Details({required this.notes});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  void deleteNote(int id) async{
    // String id=widget.notes.id.toString();
    final  apiUrl=Uri.parse("http://172.20.10.10:8000/delete_note/$id" );
    final response = await http.delete(apiUrl);
    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => deleteNote(widget.notes.id)
          ),
        ],
      ),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Title:${widget.notes.title}",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              "Body: ${widget.notes.body}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Update(notes: widget.notes)),
            );
          }
      ),
    );
  }
}