import 'package:flutter/material.dart';
import 'package:rankprof/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rankprof/services/auth.dart';
const backgroundColor = Color(0xff5E37DB);
 
class UserPageState extends StatefulWidget {
  final AuthBase auth;
  final List<DocumentSnapshot> documents;
  final Map<String, String> departamentos;

  UserPageState({Key key, this.documents, @required this.auth}):
       departamentos = documents.fold({}, (Map<String, String> map, document) {
          if (!map.containsKey(document['Id'])) {
            map[document['Id']] = '';
          }
          map[document['Id']] = document[''];
          return map;
        }),
  super(key: key);

  @override
  _UserPageState createState() => _UserPageState();

  // Future<void> _signOut() async {g
  //   try {
  //     await auth.signOut();
  //     print('User Signed Out');
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
 
class _UserPageState extends State<UserPageState> {
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
                Opacity(
                  opacity: 0,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {}),
                ),
                Center(
                  child: Text(
                    "Departamento",
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
                          Navigator.of(context).pushNamed('/signin');
                        },
                        child: Text(
                          '   SignOut   ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold
                          ),
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

//  Widget _item(String item) {

//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).pushNamed('/home');
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 8.0),
//         child: IntrinsicHeight(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         Container(
//                           width: 42.0,
//                           height: 42.0,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(21.0),
//                             color: Colors.green,
//                           ),
//                           child: Center(
//                             child: Text(item.substring(0,1),
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 8.0),
                        
//                       ],
//                     ),
//                     Text(item,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 16.0,
//                       ),
//                     ),
//                     Text(item,
//                       style: TextStyle(
//                         color: Colors.orange,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(width: 16.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  





















// Forma cada iten de la lista
  Widget _item(String name) {
    return new GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => (materiapf: name),
      //     )
      //   );
      // },
      child: ListTile(
        trailing: Container(
          width: 42.0,
          height: 42.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.deepPurple,
          ),
          child: Center(
            child: Text(name.substring(0,1),
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
          return _item(key);
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
