// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/database/db_helper.dart';
import 'package:todo_app/models/model_todo.dart';
import 'package:todo_app/screens/screen_home.dart';

import '../controllers/todo_controller.dart';

class ScreenAddTodo extends StatefulWidget {
  const ScreenAddTodo({Key? key}) : super(key: key);

  @override
  State<ScreenAddTodo> createState() => _ScreenAddTodoState();
}

class _ScreenAddTodoState extends State<ScreenAddTodo> {
  TodoController todoController = Get.put(TodoController());

  var title = "";
  var description = ""; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter Title",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter Description",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  todoController
                      .addTodo(
                    ModelTodo(
                      title: title,
                      description: description,
                      createddAt: DateTime.now().toString(),
                      modifideAt: DateTime.now().toString(),
                    ),
                  )
                      .then((value) {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => ScreenHome()));
                  }); 
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
