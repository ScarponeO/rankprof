import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Department extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  final Map<String, String> materias;
  //final Map<String, String> prof;
  
  Department({Key key, this.documents}): 
  
    materias = documents.fold({}, (Map<String, String> map, document) {
          if (!map.containsKey(document['materia'])) {
            map[document['materia']] = '';
          }
          map[document['materia']] = document['name'];
          return map;
        }),
  super(key: key);

  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
    child: Column(
      children: <Widget>[
        _list(),
      ],
    ),
    );
  }
    Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      onTap: () {},
    );
  }

  Widget _item(IconData icon, String name, String profe) {
    return ListTile(
      leading: Icon(icon, size: 30.0,),
      title: Text(name,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
        ),
      ),
      subtitle: Text("Profesor:$profe",
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.blueGrey,
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
            child:  Text("Rankear",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
              onPressed: () {
                Navigator.of(context).pushNamed('/profesor');
              }
          ),
        ),
      ),
    );
  }


  Widget _list() {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.documents.length,
        itemBuilder: (BuildContext context, int index){
          var key = widget.materias.keys.elementAt(index);
          var ke = widget.materias[key];
          return _item(FontAwesomeIcons.userCheck, key, ke);
        },

        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blueAccent.withOpacity(0.15),
            height: 8.0,
          );
        },
      ),
    );
  }

}