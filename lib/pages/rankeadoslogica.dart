import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rankprof/pages/vistaprofesor22.dart';
 
class Rankeados extends StatefulWidget {
  // Esto de aca es para recibir la variable que se usa para el query
 final String profe;
 final String materia2;
  Rankeados({this.profe, this.materia2, });
  @override
  State<StatefulWidget> createState() => _RankeadosState();
}
 
class _RankeadosState extends State<Rankeados> {
  Stream<QuerySnapshot> _query;

  @override
  void initState() {
    super.initState();
    
    _query = Firestore.instance
      .collection('Usuarios')
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
                return VistaProfssor22(documents: data.data.documents, materia3: widget.materia2, profesor: widget.profe, );
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