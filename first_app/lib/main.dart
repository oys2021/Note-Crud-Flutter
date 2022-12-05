
import 'package:flutter/material.dart';
import 'package:first_app/listdata.dart';
import 'package:first_app/model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:first_app/MyApp.dart';
// import 'package:first_app/adddata.dart';


void main() {
  runApp(
      AppContainer()
  );
}



class AppContainer extends StatelessWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homeview(),
    );
  }
}