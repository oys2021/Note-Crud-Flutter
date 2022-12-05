import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:first_app/model.dart';
import 'package:http/http.dart' as http;



class Create extends StatefulWidget {
  // final Note notes;
  // Details({required this.notes});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

// void deleteNote(context) async{
// String id=widget.notes.id.toString();
// final  apiUrl=Uri.parse("http://172.20.10.10:8000/delete_note/$id" );
//  final response = await http.get(apiUrl);

// }
TextEditingController _title=TextEditingController();
TextEditingController _body=TextEditingController();
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
          ElevatedButton(onPressed: () async{
            final  apiUrl=Uri.parse("http://172.20.10.10:8000/notes/create" );
            final response = await http.post(apiUrl,body:{"title":_title.text,"body":_body.text});
            print(response.body);
            Navigator.pop(context);

          }, child: Text("Create Note"))

        ],


      )

    );
  }
}