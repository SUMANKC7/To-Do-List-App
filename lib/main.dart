import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/pages/homepage.dart';

void main() async{
 await Hive.initFlutter();
  //open a box
  var box=await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To-Do-List",
      home:  HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
