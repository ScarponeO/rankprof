import 'package:flutter/material.dart';
import 'package:rankprof/pages/materia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 
class ListMateriaPageState extends StatefulWidget {
  // Esto de aca es para recibir la variable que usare para el query
  final String materiapf;
  final String usuario1;
  ListMateriaPageState({this.materiapf, this.usuario1});
  @override
  State<StatefulWidget> createState() => _ListMateriaPageState();
}
 
class _ListMateriaPageState extends State<ListMateriaPageState> {
  Stream<QuerySnapshot> _query;
  
  @override
  void initState() {
    super.initState();
    // aca traigo las cosas de firebase

    _query = Firestore.instance
        .collection('Materias')
        .where('dpto' , isEqualTo: widget.materiapf)
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
          // _selector(),
          StreamBuilder<QuerySnapshot>(
            stream: _query,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> data) {
              if (data.hasData) {
                return Materia(documents: data.data.documents, usuario2: widget.usuario1);
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