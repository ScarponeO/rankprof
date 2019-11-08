import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Logicalp extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  final Map<String, String> profesores;
  //final Map<String, String> prof;

  Logicalp({Key key, this.documents}):

        profesores = documents.fold({}, (Map<String, String> map, document) {
          if (!map.containsKey(document['name'])) {
            map[document['name']] = '';
          }
          map[document['name']] = document[''];
          return map;
        }),
        super(key: key);

  @override
  _LogicalpState createState() => _LogicalpState();
}

class _LogicalpState extends State<Logicalp> {
  var key;
  @override


  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          _searchBar(),
          //_list(),          // ---------------------> DESCOMENTEN ESTO TAMBIEN
        ],
      ),
    );
  }



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
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }



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
              child:  Text("Profesores",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
              onPressed: () {
                return Navigator.of(context).pushNamed('/listap');
              }
          ),
        ),
      ),
    );
  }


  // POR FAVOR DESCOMENTEN TODO EL CODIGO QUE ESTA COMENTADO, ESTA VISTA MUESTRA LOS PROFESORES PERO HAY UN PROBLEMA CON EL INDEX
 /* Widget _list() {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.documents.length,
        itemBuilder: (BuildContext context, int index){
          key = widget.profesores.keys.elementAt(index);
          return _item(FontAwesomeIcons.chalkboardTeacher, key);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Color(0xff00008b),
            height: 0.0,
          );
        },
      ),
    );
  } */

}

