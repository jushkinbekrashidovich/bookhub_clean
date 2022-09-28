import 'package:flutter/cupertino.dart';

class Todo {
  String text;
  int? postedTimestamp;
  Todo({ required this.text, this.postedTimestamp});

  factory Todo.fromJson(Map<String, dynamic> json) =>
      Todo(
        text: json['text'], 
        postedTimestamp: json['postedTimestamp'], 
        );

  Map<String, dynamic> toJson() => {
    'text': text,
    'postedTimestamp':postedTimestamp,
  };
    
  
}