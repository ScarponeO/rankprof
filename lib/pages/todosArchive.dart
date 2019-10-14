import 'package:flutter/material.dart';

class TodosArchivePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TodosArchivePageState();
}


class _TodosArchivePageState extends State<TodosArchivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archivo'),
      ),
      body: Center(
        child: Text("Esto es la pagina de archivos"),
      ),
    );
  }
}