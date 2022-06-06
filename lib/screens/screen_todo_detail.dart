// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/models/model_todo.dart';

class ScreenTodoDetail extends StatefulWidget {
  String title, description, createdAt;
  int id;
  ScreenTodoDetail({
    Key? key,
    required this.description,
    required this.title,
    required this.id,
    required this.createdAt,
  }) : super(key: key);

  @override
  State<ScreenTodoDetail> createState() => _ScreenTodoDetailState();
}

class _ScreenTodoDetailState extends State<ScreenTodoDetail> {
  bool isEdit = false;
  TodoController todoController = Get.put(TodoController());

  onSaved(ModelTodo todo) {
    todoController.updateTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                isEdit = true;
              });
            },
            child: Text("Edit"),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                readOnly: isEdit ? false : true,
                onChanged: (value) {
                  setState(() {
                    widget.title = value;
                  });
                  onSaved(ModelTodo(
                    id: widget.id,
                    title: value,
                    description: widget.description,
                    createddAt: widget.createdAt,
                     modifideAt: DateFormat("hh:mm:ss a").format(DateTime.now()),
                  ));
                },
                initialValue: widget.title,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: TextFormField(
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  readOnly: isEdit ? false : true,
                  initialValue: widget.description,
                  onChanged: (value) {
                    setState(() {
                      widget.description = value;
                    });
                    onSaved(ModelTodo(
                      id: widget.id,
                      title: value,
                      description: value,
                      createddAt: widget.createdAt,
                      modifideAt: DateFormat("hh:mm:ss a").format(DateTime.now()),
                    ));
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Description",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
