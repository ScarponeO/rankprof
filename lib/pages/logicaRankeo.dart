import 'dart:core' as prefix0;
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class LogicaRankeo extends StatefulWidget {



      final double aptitud1;
      final double aptitud2;
      final double aptitud3;
      final double aptitud4;
      final double aptitud5;

  LogicaRankeo({this.aptitud1, this.aptitud2, this.aptitud3, this.aptitud4, this.aptitud5}) :
        super();






  @override
  State<StatefulWidget> createState() => _LogicaRankeoState();
}

class _LogicaRankeoState extends State<LogicaRankeo> {




  void getData() {
    var databaseReference;
    databaseReference
        .collection("Profesores")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


    );
  }



}
