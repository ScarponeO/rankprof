import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SettingsPageState();

}


class _SettingsPageState extends State<SettingsPage>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraciones'),
      ),
      body: Center(
        child: Text("Esto es la pagina de configuraciones"),
      ),
    );
  }
}