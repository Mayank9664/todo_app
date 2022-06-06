import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:todo_app/database/db_helper.dart';
import 'package:todo_app/models/model_todo.dart';

class TodoController extends GetxController {
  var isLoading = true.obs;
  List<ModelTodo> alltodos = <ModelTodo>[].obs;
  late DbHelper dbHelper;

  @override
  void onInit() {
    dbHelper = DbHelper();
    fetchAllTodos();
    super.onInit();
  }

 Future fetchAllTodos() async {
    isLoading(true);
    try {
      alltodos = await dbHelper.getAllTodos();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.white,
        textColor: Colors.black,
      );
    }
  }

  addTodo(ModelTodo todo) async {
    try {
      await dbHelper.addTodo(todo);
      await fetchAllTodos();
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Controller Side : $e",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.white,
        textColor: Colors.black,
      );
    }
  }

  updateTodo(ModelTodo todo) async {
    try {
      await dbHelper.updateTodo(todo);
      await fetchAllTodos();
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.white,
        textColor: Colors.black,
      );
    }
  }

  deleteTodo(int id) async {
    try {
      await dbHelper.deleteTodo(id);
      await fetchAllTodos();
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.white,
        textColor: Colors.black,
      );
    }
  }
}
