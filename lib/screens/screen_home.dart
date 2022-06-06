// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/screens/screen_add_todo.dart';
import 'package:todo_app/screens/screen_todo_detail.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);
  TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return todoController.isLoading.value == true
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: () async {
                    await todoController.fetchAllTodos();
                  },
                  child: ListView.builder(
                    itemCount: todoController.alltodos.length,
                    itemBuilder: (context, int i) {
                      return Dismissible(
                        key: Key(todoController.alltodos[i].id.toString()),
                        onDismissed: (val) {
                          todoController.deleteTodo(int.parse(
                              todoController.alltodos[i].id.toString()));
                          debugPrint("Val is : ${val}");
                        },
                        child: ListTile(
                          title:
                              Text(todoController.alltodos[i].title.toString()),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => ScreenTodoDetail(
                                    createdAt: todoController
                                        .alltodos[i].createddAt
                                        .toString(),
                                    title: todoController.alltodos[i].title
                                        .toString(),
                                    description: todoController
                                        .alltodos[i].description
                                        .toString(),
                                    id: int.parse(todoController.alltodos[i].id
                                        .toString()),
                                  ),
                                ),
                              );
                            },
                            child: Icon(Icons.edit),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(todoController.alltodos[i].description
                                  .toString()),
                              Text(
                                  "Created At : ${todoController.alltodos[i].createddAt}"),
                              Text(
                                  "Modifide At : ${todoController.alltodos[i].modifideAt}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (_) => ScreenAddTodo()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
