import 'package:flutter/material.dart';
import 'package:rankprof/pages/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rankprof/services/auth.dart';
 
class PerfilPage extends StatefulWidget {
  final AuthBase auth;
  const PerfilPage({@required this.auth}) ;

  @override
  State<StatefulWidget> createState() => _PerfilPageState();
}
 
class _PerfilPageState extends State<PerfilPage> {
  Stream<QuerySnapshot> _query;

  @override
  void initState() {
    super.initState();

    _query = Firestore.instance
        .collection('Usuarios')
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
                return UserPageState(documents: data.data.documents, auth: Auth(),);
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