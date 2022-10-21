import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/todo.dart';

class TodoController extends GetxController {
  //TODO: Implement TodoController
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController titleOfBookcontroller = TextEditingController();
  
  
  
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    
    List? storedTodos = GetStorage().read('todos');
    todos.value = storedTodos!.map((e) => Todo.fromJson(e)).toList().obs;
    ever(todos, (_) async{
      await GetStorage().write('todos', todos.toList());
    });
    
    super.onInit();
  }
  


  
}
