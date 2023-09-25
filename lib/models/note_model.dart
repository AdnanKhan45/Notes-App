
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String? id;
  final String? title;
  final String? body;
  final int? color;

  NoteModel({this.id, this.title, this.body, this.color});

  factory NoteModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return NoteModel(
      title: snapshot['title'],
      body: snapshot['body'],
      color: snapshot['color'],
      id: snapshot['id'],
    );
  }

  Map<String, dynamic> toDocument() => {
    "title": title,
    "id": id,
    "body": body,
    "color": color,
  };
}