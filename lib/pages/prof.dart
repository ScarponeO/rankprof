import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 
 
class Prof extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  final Map<String, String> departamentos;
  //final Map<String, String> prof;
  
  Prof({Key key, this.documents}): 
  
    departamentos = documents.fold({}, (Map<String, String> map, document) {
      if (!map.containsKey(document['name'])) {
        map[document['name']] = '';
      }
        map[document['name']] = document[''];
      return map;
    }),
  super(key: key);
 
  @override
  _ProfState createState() => _ProfState();
}
 
class _ProfState extends State<Prof> {
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
        color: Color(0xff00008b),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: Center(
          child:  Text("Profesores",
            style: TextStyle(
              fontFamily: 'Satisfy',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
 
 
// Forma cada iten de la lista
  Widget _item(IconData icon, String name) {
    return ListTile(
      leading: Icon(icon, size: 30.0,),
      title: Text(name,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            color: Color(0xff00008b),
            child:  Text("Rankear",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
              onPressed: () {
                return Navigator.of(context).pushNamed('/profesor');
              }
          ),
        ),
      ),
    );
  }
 
 
 // Esta es la lista como tal, es decir, asi se crea
  Widget _list() {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.documents.length,
        itemBuilder: (BuildContext context, int index){
          key = widget.departamentos.keys.elementAt(index);
          return _item(FontAwesomeIcons.chalkboardTeacher, key);
        },
        // separatorBuilder: (BuildContext context, int index) {
        //   return Container(
        //     color: Color(0xff00008b),
        //     height: 1.0,
        //   );
        // },
      ),
    );
  }




//   Widget getList() {
//   List<String> list = getListItems();
//   ListView myList = new ListView.builder(
//     itemCount: list.length,
//     itemBuilder: (context, index) {
//     return new ListTile(
//       title: new Text(list[index]),
//     );
//   });
//   return myList;
//  }




 
}
 
