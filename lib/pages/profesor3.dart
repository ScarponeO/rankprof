import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profesor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        centerTitle: true,
        title: Text(
          'RankProf',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      body: build_box(context),
    );
  }

  Widget build_box(context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,//--> este codigo perimte que la caja se etire lo mas que pueda,
        mainAxisAlignment: MainAxisAlignment.start,//------> por lo que no hay necesidad de width.
        children: <Widget>[
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.all(30), //Este es el padding que afecta a toda la caja
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              color: Colors.indigo,
            ),
            child: Column( //--------------------------------> De aqui en adelante empieza lo que esta dento de la caja
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(2), //---> Nombre del Profesor
                  child: Text(
                    'Jose Areas',
                    textAlign
                        : TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),//---> Materia
                  child: Text(
                    'Fisica 1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),//---> Estrellas
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.yellow[700]),
                      Icon(Icons.star, color: Colors.yellow[700]),
                      Icon(Icons.star, color: Colors.yellow[700]),
                      Icon(Icons.star, color: Colors.white),
                      Icon(Icons.star, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(10),//------------> Titulo Biografia
                  child: Text(
                    'Biografia',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),//--------------> Biografia como tal
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur '
                        'adipiscing elit. Maecenas venenatis est consectetur '
                        'interdum dictum. Nunc ante lectus, laoreet eget tellus id, '
                        'tincidunt pulvinar mi. Maecenas tincidunt tristique diam, id '
                        'fringilla turpis vulputate vel. In hac habitasse platea dictumst.'
                        ' Vestibulum lobortis aliquam bibendum. Maecenas vel congue nulla. ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 80),
                RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Rankear a este profesor',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/starfeedback');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}