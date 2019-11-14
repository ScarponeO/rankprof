import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rankprof/pages/professor.dart';

class Prof extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  final Map<String, String> departamentos;
  final String materia;
  //final Map<String, String> prof;

  Prof({Key key, this.documents, this.materia}): 
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
                "Profesores",
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
  Widget _item(IconData icon, String name) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(
            builder: (_) => Profes(profe: name, materia2: widget.materia),
          ),
        );
      },
      child: ListTile(
        leading: Icon(
          icon,
          size: 30.0,
        ),
        title: Text( name,
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











 
//   // fUTURA barra de busqueda (POR AHORA SOLO LA CUESTION DE ARRIBA)
//   Widget _searchBar() {
//     return Container(
//       height: 60.0,
//       decoration: BoxDecoration(
//         color: Colors.blue[900],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 1.0),
//         child: Row(
//           children: <Widget>[
//             IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 color: Colors.white,
//                 onPressed: () {
//                   Navigator.pop(context);
//                 }),
//             Center(
//               child: Text(
//                 "PROFESORES",
//                 style: TextStyle(
//                   fontFamily: 'Roboto-Regular',
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 25.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// // Forma cada iten de la lista
//   Widget _item(IconData icon, String name) {
//     return new GestureDetector(
//       onTap: () {
//         return Navigator.of(context).pushNamed('/profesor');
//       },
//       child: ListTile(
//         leading: Icon(
//           icon,
//           size: 30.0,
//         ),
// <<<<<<< HEAD
//       ),
//       trailing: Container(
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.2),
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: RaisedButton(
//             color: Color(0xff00008b),
//             child:  Text("Profesores",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16.0,
//               ),
//             ),
//               onPressed: () => Navigator.push(context,
//               MaterialPageRoute(
//               builder: (_) => Profes(profe: name),
//               ),
//             ),
//           ),
// =======
//         title: Text(
//           name,
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 23.0,
//               fontFamily: 'Roboto-Regular'),
// >>>>>>> a6e625777ac8c07090e26e04014852ce8d7ab198
//         ),
//       ),
//     );
//   }

//   // Esta es la lista como tal, es decir, asi se crea
//   // Widget _listb() {
//   //   return Expanded(
//   //     child: ListView.builder(
//   //       itemCount: widget.documents.length,
//   //       itemBuilder: (BuildContext context, int index){
//   //         key = widget.departamentos.keys.elementAt(index);
//   //         return _item(FontAwesomeIcons.chalkboardTeacher, key);
//   //       },
//   //       separatorBuilder: (BuildContext context, int index) {
//   //         return Container(
//   //           color: Color(0xff00008b),
//   //           height: 1.0,
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }
//   Widget _list() {
//     return Expanded(
//       child: ListView.separated(
//         itemCount: widget.documents.length,
//         itemBuilder: (BuildContext context, int index) {
//           key = widget.departamentos.keys.elementAt(index);
//           return _item(FontAwesomeIcons.chalkboardTeacher, key);
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return Container(
//             color: Colors.grey[600],
//             height: 1.0,
//           );
//         },
//       ),
//     );
//   }
