import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jul6_api_learn/models/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Todos? todos;
  final domain = "dummyjson.com";
  final api = "/todos";
  int? id;
  void getDataFromCloud({
    required String api,
    String baseUrl = "dummyjson.com",
    int? id,
  }) {
    Uri uri = Uri.https(baseUrl, '$api${id != null ? '/$id' : ''}');
    get(uri).then((response) {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        todos = Todos(
          id: result['id'],
          todo: result['todo'],
          completed: result['completed'],
          userId: result['userId'],
        );
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    getDataFromCloud(api: api, id: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: todos != null
                      ? ListTile(
                          leading: Text(todos!.id.toString()),
                          trailing: Text(todos!.userId.toString()),
                          title: Text(todos!.todo),
                          subtitle: Text(todos!.completed.toString()),
                        )
                      : Text('No Data')),
            ],
          ),
        ),
      ),
    );
  }
}
