import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:big_fit_vize/model/whatiate.dart';
import 'package:big_fit_vize/services/dbhelper.dart';
import 'package:intl/intl.dart';

final List<String> choices = const <String>[menuSave, menuDelete, menuBack];

const menuSave = "kaydet ve çık";
const menuDelete = "sil";
const menuBack = "geri dön";

DbHelper helper = DbHelper();

class TodoDetail extends StatefulWidget {
  final Todo todo;

  TodoDetail(this.todo);

  @override
  State<StatefulWidget> createState() {
    return TodoDetailState(todo);
  }
}

class TodoDetailState extends State {
  Todo todo;

  TodoDetailState(this.todo);
  final _priorities = ["Sabah", "Öğle", "Akşam"];
  String _priority = "Akşam";
  final _formDistance = 5.0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descController.text = todo.description;
    var textStyle = Theme.of(context).textTheme.caption;
    var title = todo.title == "" ? "Yeni Öğün" : todo.title;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          automaticallyImplyLeading: false,
          title: Text(title),
          actions: [
            PopupMenuButton<String>(
              onSelected: select,
              itemBuilder: (BuildContext context) {
                return choices.map((e) {
                  return PopupMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList();
              },
            )
          ],
        ),
        body:
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              Padding(
                padding:
                EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Ne Yedin?",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)))),
              ),
              DropdownButton<String>(
                dropdownColor: Colors.pink,
                value: this._priorities[this.todo.priority - 1],
                items: _priorities.map((String str) {
                  return DropdownMenuItem<String>(
                    value: str,
                    child: Text(str),
                  );
                }).toList(),
                onChanged: (String str) {
                  updatePriority(str);
                },
              ),
              ElevatedButton(onPressed: save, child: Text(menuSave)),
              ElevatedButton(onPressed: delete, child: Text(menuDelete)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(menuBack)),
            ],
          ),
        ));
  }

  void updatePriority(String value) {
    int priority = 0;
    switch (value) {
      case "Sabah":
        priority = 1;
        break;
      case "Öğle":
        priority = 2;
        break;
      case "Akşam":
        priority = 3;
        break;
      default:
    }
    setState(() {
      this.todo.priority = priority;
    });
  }

  void select(String value) async {
    switch (value) {
      case menuSave:
        save();
        break;
      case menuDelete:
        delete();
        break;
      case menuBack:
        Navigator.pop(context, true);
        break;
      default:
    }
  }

  void delete() async {
    Navigator.pop(context, true);
    if (todo.id == null) {
      return;
    }
    int result;
    result = await helper.deleteTodo(todo.id);
    if (result != 0) {
      AlertDialog alertDialog = AlertDialog(
        backgroundColor: Colors.pink,
        title: Text("silindi"),
        content: Text("kayıt silindi"),
      );
      showDialog(context: context, builder: (_) => alertDialog);
    }
  }

  void save() {
    todo.title = titleController.text;
    todo.description = descController.text;
    todo.date = new DateFormat.yMd().format(DateTime.now());
    if (todo.id != null) {
      helper.updateTodo(todo);
    } else {
      helper.insertTodo(todo);
    }
    Navigator.pop(context, true);
    showAlert(todo.id != null);
  }

  void showAlert(bool isUpdate) {
    AlertDialog alertDialog;
    if (isUpdate) {
      alertDialog = AlertDialog(
        backgroundColor: Colors.pink,
        title: Text("güncellendi"),
        content: Text("kayıt güncellendi"),
      );
    } else {
      alertDialog = AlertDialog(
        backgroundColor: Colors.pink,
        title: Text("eklendi"),
        content: Text("kayıt eklendi"),
      );
    }
    showDialog(context: context, builder: (_) => alertDialog);
  }
}