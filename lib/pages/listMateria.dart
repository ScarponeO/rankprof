import 'package:flutter/material.dart';
import 'package:rankprof/pages/department.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 
class ListMateriaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListMateriaState();
}

class _ListMateriaState extends State<ListMateriaPage> {
  int currentPage = 1;
  Stream<QuerySnapshot> _query;
  String Materias = '';

  @override
  void initState() {
    super.initState();
 
    _query = Firestore.instance
      .collection('Departamentos')
      .document('$Materias')
      .get()
      .then((docSnap) {
        var snapshot;
          var name = snapshot['name'];
        assert(name is String);
        return name;
      }) as Stream<QuerySnapshot>;
    // _query = Firestore.instance
    //     .collection('Departamentos')
    //     .snapshots();
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
                  return Department(documents: data.data.documents);
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





