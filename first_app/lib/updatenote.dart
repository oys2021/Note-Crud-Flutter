import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:first_app/model.dart';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:first_app/model.dart';
import 'package:http/http.dart' as http;



class Update extends StatefulWidget {
  final Note notes;
  Update({required this.notes});

  // final Note notes;
  // Details({required this.notes});

  @override
  State<Update> createState() => _updateState();
}

class _updateState extends State<Update> {
  late TextEditingController _title= TextEditingController(text: widget.notes.title);
  late TextEditingController _body=TextEditingController(text: widget.notes.body);
// void deleteNote(context) async{
// String id=widget.notes.id.toString();
// final  apiUrl=Uri.parse("http://172.20.10.10:8000/delete_note/$id" );
//  final response = alate wait http.get(apiUrl);

// }

  getUpdate(int id) async{
    final  apiUrl=Uri.parse("http://172.20.10.10:8000/update_note/$id" );
    final response = await http.put(apiUrl,body:{"title":_title.text,"body":_body.text});
    print(response.body);
    Navigator.pop(context);

  }
  @override
  void initState() {
    TextEditingController _title = TextEditingController(
        text: widget.notes.title);
    TextEditingController _body = TextEditingController(
        text: widget.notes.body);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(Icons.delete),
            //   onPressed: () => deleteNote(context),
            // ),
          ],
        ),
        body: Column(
          children: [
            TextFormField(controller: _title),
            SizedBox(height:25,),
            TextField(controller: _body,maxLines:10,),
            ElevatedButton(onPressed: ()=> getUpdate(widget.notes.id), child: Text("Create Note"))

          ],


        )

    );
  }
}