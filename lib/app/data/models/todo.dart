class Todo {
  String text;
  bool done;

  Todo({ required this.text, this.done = false});

  factory Todo.fromJson(Map<String, dynamic> json) =>
      Todo(
        text: json['text'], 
        done: json['done']
        );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text']= text; 
    data['done']= done;
    return data;
    
    }
}