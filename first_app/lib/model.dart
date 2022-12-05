// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// part 'model.g.dart';

class Note {
  final int id;
  final String title;
  final String body;
  Note({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'body':body,
  };
}