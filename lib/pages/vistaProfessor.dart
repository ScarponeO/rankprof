import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:rankprof/pages/starfeedback2.dart';
import 'package:intl/intl.dart';
import 'package:rankprof/services/auth.dart';

class VistaProfssor extends StatefulWidget {
  final double puntotal;
  final String usuarioserio;
  IconData myFeedback = FontAwesomeIcons.meh;
  Color myFeedbackColor = Color(0xff00008b);
  var myFeedbackText = 'Puntuacion total 0';
  double valortotal1 = 1;

  final List<DocumentSnapshot> documents;
  final Map<String, String> departamentos;
  final double acu1;
  final double acu2;
  final double acu3;
  final double acu4;
  final double acu5;
  final double ranking1;
  final String profesor;
  final String materia3;
  final double ranking2;
  final double ranking3;
  final double ranking4;
  final double ranking5;
  final double total;
  final String id;
  final double cont;

  //final Map<String, String> prof;

  VistaProfssor(
      {Key key, this.documents, this.profesor, this.materia3, this.puntotal, this.usuarioserio})
      : departamentos = documents.fold({}, (Map<String, String> map, document) {
          if (!map.containsKey(document['R.'])) {
            map[document['name']] = '';
          }
          map[document['name']] = document['materia'];
          return map;
        }),
        ranking1 = documents
            .map((doc) => doc['disponibilidad'])
            .fold(0, (a, b) => a + b),
        ranking2 =
            documents.map((doc) => doc['exigencia']).fold(0, (a, b) => a + b),
        ranking3 =
            documents.map((doc) => doc['interacción']).fold(0, (a, b) => a + b),
        ranking4 = documents
            .map((doc) => doc['responsabilidad'])
            .fold(0, (a, b) => a + b),
        ranking5 =
            documents.map((doc) => doc['pedagogía']).fold(0, (a, b) => a + b),
        acu1 = documents
            .map((doc) => doc['acudisponibilidad'])
            .fold(0, (a, b) => a + b),
        acu2 = documents
            .map((doc) => doc['acuexigencia'])
            .fold(0, (a, b) => a + b),
        acu3 = documents
            .map((doc) => doc['acuinteracción'])
            .fold(0, (a, b) => a + b),
        acu4 = documents
            .map((doc) => doc['acupedagogía'])
            .fold(0, (a, b) => a + b),
        acu5 = documents
            .map((doc) => doc['acuresponsabilidad'])
            .fold(0, (a, b) => a + b),
        total = documents.map((doc) => doc['total']).fold(0, (a, b) => a + b),
        cont = documents.map((doc) => doc['contador']).fold(0, (a, b) => a + b),
        id = documents.map((doc) => doc['id']).fold('', (a, b) => a + b),
        super(key: key);

  @override
  _VistaProfssorState createState() => _VistaProfssorState();
}

class _VistaProfssorState extends State<VistaProfssor> {
  double hola = 3;

  void funcionIcono() {
    if (widget.total >= 1 && widget.total < 2) {
      myFeedback = FontAwesomeIcons.sadTear;
      myFeedbackColor = Colors.red[700];
      myFeedbackText = "Puntuación total: 1";
    }
    if (widget.total >= 2 && widget.total < 3) {
      myFeedback = FontAwesomeIcons.frown;
      myFeedbackColor = Colors.amber;
      myFeedbackText = "Puntuación total: 2";
    }
    if (widget.total >= 3 && widget.total < 4) {
      myFeedback = FontAwesomeIcons.check;
      myFeedback = FontAwesomeIcons.meh;
      myFeedbackColor = Colors.yellow;
      myFeedbackText = "Puntuación total: 3";
    }
    if (widget.total >= 4 && widget.total < 5) {
      myFeedback = FontAwesomeIcons.smile;
      myFeedbackColor = Colors.lightGreenAccent;
      myFeedbackText = "Puntuación total: 4";
    }
    if (widget.total >= 5 && widget.total < 6) {
      myFeedback = FontAwesomeIcons.laugh;
      myFeedbackColor = Colors.green;
      myFeedbackText = "Puntuación total: 5";
    }
  }

  void comparar() {
    print(widget.id);
  }

  var key;
  IconData myFeedback = FontAwesomeIcons.award;
  Color myFeedbackColor = Color(0xff00008b);
  var myFeedbackText = 'Puntuacion total 0';

  @override

  // Aqui se estan "llamando las cosas"
  Widget build(BuildContext context) {
    return Provider<User>(
      builder: (context) =>
          User(uid: null, email: null, displayName: null, photoUrl: null),
      child: Expanded(
        child: Column(
          children: <Widget>[
            _searchBar(),
            _nameProf(),
            _informacion(),
            _desc(),
          ],
        ),
      ),
    );
  }

  Widget _nameProf() {
    return Column(
      children: <Widget>[
        SizedBox(height: 15.0),
        Text(
          widget.profesor,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
          ),
        ),
        Text(
          widget.materia3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }

  Widget _informacion() {
    funcionIcono();
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Icon(
                  myFeedback,
                  color: myFeedbackColor,
                  size: 80.0,
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Text(
              myFeedbackText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 22.0),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0),
            child: Container(
                child: Text(
              'Disponibilidad: ' + widget.ranking1.toStringAsFixed(2),
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0),
            child: Container(
                child: Text(
              'Exigencia academica: ' + widget.ranking2.toStringAsFixed(2),
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0),
            child: Container(
                child: Text(
              'Interaccion: ' + widget.ranking3.toStringAsFixed(2),
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0),
            child: Container(
                child: Text(
              'Responsabilidad: ' + widget.ranking4.toStringAsFixed(2),
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20.0),
            child: Container(
                child: Text(
              'Pedagogia: ' + widget.ranking5.toStringAsFixed(2),
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            )),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  // fUTURA barra de busqueda (POR AHORA SOLO LA CUESTION DE ARRIBA)
  Widget _searchBar() {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.blue[900],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                }),
            Center(
              child: Text(
                "Rank Prof",
                style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _desc() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
            child: RaisedButton(
              color: Colors.blue[900],
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Rankear',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => StarFeedback2(
                            valor1: widget.acu1,
                            valor2: widget.acu2,
                            valor3: widget.acu3,
                            valor4: widget.acu4,
                            valor5: widget.acu5,
                            idenviar: widget.id,
                            contt: widget.cont,
                            superusuario: widget.usuarioserio,
                            profesor: widget.profesor,
                            materiaa: widget.materia3,
                          ))),
            ),
          ),
        ],
      ),
    );
  }
}
