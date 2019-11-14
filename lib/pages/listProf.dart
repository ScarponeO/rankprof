import 'package:flutter/material.dart';
import 'package:rankprof/pages/prof.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 
class ListProfPage extends StatefulWidget {
  // Esto de aca es para recibir la variable que se usa para el query
  final String profe;
  ListProfPage({this.profe});
  @override
  State<StatefulWidget> createState() => _ListProfPageState();
}
 
class _ListProfPageState extends State<ListProfPage> {
  Stream<QuerySnapshot> _query;

  @override
  void initState() {
    super.initState();

    _query = Firestore.instance
      .collection('Profesores')
      .where('materia' , isEqualTo: widget.profe)
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
                return Prof(documents: data.data.documents, materia: widget.profe);
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