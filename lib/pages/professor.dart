import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rankprof/pages/vistaProfessor.dart';
 
class Profes extends StatefulWidget {
  // Esto de aca es para recibir la variable que se usa para el query
  final String profe;
  final String materia2;
  final String usuario5;
  Profes({this.profe, this.materia2, this.usuario5});
  @override
  State<StatefulWidget> createState() => _ProfesState();
}
 
class _ProfesState extends State<Profes> {
  Stream<QuerySnapshot> _query;

  @override
  void initState() {
    super.initState();
    
    _query = Firestore.instance
      .collection('Profesores')
      .where('name' , isEqualTo: widget.profe)
      .snapshots();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }


  Widget _body() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: _query,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> data) {
              if (data.hasData) {
                return VistaProfssor(documents: data.data.documents , profesor: widget.profe, materia3: widget.materia2, usuarioserio: widget.usuario5);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
  



}