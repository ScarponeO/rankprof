import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rankprof/pages/department.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rankprof/services/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;
  Stream<QuerySnapshot> _query;

  @override
  void initState() {
    super.initState();

    _query = Firestore.instance.collection('Departamentos').snapshots();
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
