import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 
 
class VistaProfssor extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  final Map<String,String> departamentos;
  final int ranking1;
  final String profesor;
  final String materia3;
  final int ranking2;
  final int ranking3;
  final int ranking4;
  final int ranking5;
  //final Map<String, String> prof;
  
  VistaProfssor({Key key, this.documents, this.profesor, this.materia3}): 
  
    departamentos = documents.fold({}, (Map<String,String> map, document) {
      if (!map.containsKey(document['R.'])) {
        map[document['name']] = '';
      }
        map[document['name']] = document['materia'];
      return map;
    }),
    ranking1 = documents.map((doc) => doc['R.disponibilidad'])
    .fold(0, (a, b) => a + b),
    ranking2 = documents.map((doc) => doc['R.exigencia'])
    .fold(0, (a, b) => a + b),
    ranking3 = documents.map((doc) => doc['R.interacción'])
    .fold(0, (a, b) => a + b),
    ranking4 = documents.map((doc) => doc['R.responsabilidad'])
    .fold(0, (a, b) => a + b),
    ranking5 = documents.map((doc) => doc['R.pedagogía'])
    .fold(0, (a, b) => a + b),
    
  super(key: key);
 
  @override
  _VistaProfssorState createState() => _VistaProfssorState();
}
 
class _VistaProfssorState extends State<VistaProfssor> {
  var key;
    IconData myFeedback = FontAwesomeIcons.award;
  Color myFeedbackColor = Color(0xff00008b);

  @override
 
  // Aqui se estan "llamando las cosas"
  Widget build(BuildContext context) {
    return Expanded(
    child: Column(
      children: <Widget>[
        _searchBar(),
         _nameProf(),
        _desc(),
      ],
    ),
    );
  }
 

   Widget _nameProf() {
    return Column(
      children: <Widget>[
        Text(widget.profesor,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
          ),
        ),
        Text(widget.materia3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.blueGrey,
          ),
        ),
      ],
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
            padding: EdgeInsets.all(10),
            child:  Text("\Disponibilidad ${widget.ranking1.toString()}",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child:  Text("\Exigenciaa ${widget.ranking2.toString()}",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child:  Text("\Interacción ${widget.ranking3.toString()}",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child:  Text("\Responsabilidad ${widget.ranking4.toString()}",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child:  Text("\Pedagogía ${widget.ranking5.toString()}",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.all(30),
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
              onPressed: () {
                Navigator.of(context).pushNamed('/starfeedback2');
              },
            ),
          ),
        ],
      ),
    );
  }




}


 
