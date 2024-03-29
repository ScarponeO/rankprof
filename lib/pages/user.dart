import 'package:flutter/material.dart';
import 'package:rankprof/pages/rankeadoslogica.dart';
import 'package:rankprof/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rankprof/pages/rankeadoslogica.dart';

const backgroundColor = Color(0xff5E37DB);

class UserPageState extends StatefulWidget {
  final AuthBase auth;
  final List<DocumentSnapshot> documents;
  final Map<String, String> departamentos;
  final String correo2;
  final String user2;

  UserPageState({Key key, this.documents, this.auth, this.correo2, this.user2, })
      : departamentos = documents.fold({}, (Map<String, String> map, document) {
          if (!map.containsKey(document['Id'])) {
            map[document['Id']] = '';
          }
          map[document['Id']] = document['profesor'];
          return map;
        }),
        super(key: key);
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPageState> {
  var key;
  var key2;
  @override

  // Aqui se estan "llamando las cosas"
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          _searchBar(),
          _list(),
        ],
      ),
    );
  }

// fUTURA barra de busqueda (POR AHORA SOLO LA CUESTION DE ARRIBA)
  Widget _searchBar() {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.blue[900],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                }),
            Center(
              child: Text(
                "Rankeados",
                style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0,
                ),
              ),
            ),
            Opacity(
              opacity: 0,
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }

// Forma cada iten de la lista

  Widget _item(String name) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Rankeados(profe: name),
            ));
      },
      child: ListTile(
        trailing: Container(
          width: 42.0,
          height: 42.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.blue[900],
          ),
          child: Center(
            child: Text(
              name.substring(0, 1),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Esta es la lista como tal, es decir, asi se crea
  Widget _list() {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.documents.length,
        itemBuilder: (BuildContext context, int index) {
          key = widget.departamentos.keys.elementAt(index);
          key2 = widget.departamentos[key];
          return _item( key2);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blueAccent,
            height: 1.0,
          );
        },
      ),
    );
  }
}