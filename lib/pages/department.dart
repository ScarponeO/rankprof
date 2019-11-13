import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rankprof/pages/home.dart';
import 'package:rankprof/pages/listMateria.dart';
import 'package:rankprof/pages/login.dart';
import 'package:rankprof/pages/sign_in.dart';
import 'package:rankprof/services/auth.dart';
import 'custom_raised_button.dart';

class Department extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  final Map<String, String> departamentos;
  final AuthBase auth;

  //final Map<String, String> prof;

  Department({Key key, this.documents, @required this.auth})
      : departamentos = documents.fold({}, (Map<String, String> map, document) {
          if (!map.containsKey(document['name'])) {
            map[document['name']] = '';
          }
          map[document['name']] = document[''];
          return map;
        }),
        super(key: key);

  @override
  _DepartmentState createState() => _DepartmentState();


 Future<void> _signOut() async {
    try {
      await auth.signOut();
      print('User Signed Out');
    } catch (e) {
      print(e.toString());
    }
  }
}

class _DepartmentState extends State<Department> {
  var key;
 

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
          children: <Widget>[
            // CustomRaisedButton(
            //   height: 30,
            //   color: Colors.blue[800],
            //   radius: 2,
            //   child: Text('SignOut'),
            //   onPressed: () {
            //    widget._signOut();
            //    Navigator.of(context).pushNamed('/signin');
            //   },
            // ),
            Center(
              child: Text(
                "DEPARTAMENTOS",
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
              child:   IconButton(  //------------------> Aqui va el logout
            icon: Icon(Icons.arrow_back),
            onPressed: () {
            }
            ),
            ),
          ],
        ),
      ),
    );
  }

// Forma cada iten de la lista
  Widget _item(IconData icon, String name) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListMateriaPageState(materiapf: name),
            ));
      },
      child: ListTile(
        leading: Icon(
          icon,
          size: 30.0,
        ),
        title: Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
              fontFamily: 'Roboto-Regular'),
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
          return _item(FontAwesomeIcons.chalkboardTeacher, key);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.grey[600],
            height: 1.0,
          );
        },
      ),
    );
  }
}
