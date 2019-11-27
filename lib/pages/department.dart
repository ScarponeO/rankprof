import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:rankprof/pages/listMateria.dart';
import 'package:rankprof/pages/miusuario.dart';
import 'package:rankprof/services/auth.dart';
import 'avatar.dart';

class Department extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  final Map<String, String> departamentos;

  //final Map<String, String> prof;

  Department({Key key, this.documents})
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

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
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
    final user = Provider.of<User>(
        context); //------------------> Este es el provider que debes usar para acceder a user

    return Column(
      children: <Widget>[
        Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.blue[900],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Avatar(
                  photoUrl: user.photoUrl,
                  radius: 18,
                ),
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
                PopupMenuButton(
                  color: Colors.white,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MiUsuario(),
                              ));
                        },
                        child: Text(
                          user.displayName, //------------------> Aqui esta llamando al user.uid que es el usuario actual con su uid.
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 20,
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                     PopupMenuItem(
                      child: GestureDetector(
                        onTap: () {
                          widget._signOut(context);
                          Navigator.of(context).pushNamed('/signin');
                        },
                        child: Text(
                          '   SignOut   ',
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
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
          return _item(FontAwesomeIcons.pencilRuler, key);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue[600],
            height: 1.0,
          );
        },
      ),
    );
  }
}
