import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:first_app/DetailWidget.dart';
import 'dart:convert';
import 'package:first_app/model.dart';



class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _classNameState();
}

class _classNameState extends State<Homeview> {
  late Future<List<Note>> notes;
  final NoteListKey = GlobalKey<_classNameState>();
  @override
  void initState() {
    super.initState();
    notes = getNotes();
  }
  Future<List<Note>>getNotes() async{
    final  apiUrl=Uri.parse("http://172.20.10.10:8000/getnote" );
    final response = await http.get(apiUrl);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Note> notes = items.map<Note>((json) {
      return Note.fromJson(json);
    }).toList();
    print(notes);
    return notes;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: NoteListKey,
      appBar:AppBar(title: Text('Student List')),
      body: Center(
        child: FutureBuilder<List<Note>>(

            future: notes,
            builder:(BuildContext context, AsyncSnapshot snapshot){
              if (!snapshot.hasData) return CircularProgressIndicator();
              return ListView.builder(
                  itemCount: snapshot?.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data[index];

                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        trailing: Icon(Icons.view_list),
                        title: Text(data.title
                            ,style: TextStyle(fontSize: 20)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Details(notes:data)),
                          );
                        },


                      ),

                    );
                  }
              );

            }),




      ),





    );
  }
}