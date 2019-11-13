import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profesor extends StatelessWidget {
  
  final String idprofe;
  Profesor({this.idprofe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); 
            }
            ),
        elevation: 2.0,
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: buildBox(context),
    );
  }

  Widget buildBox(context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50),
          Text(
            'MIRNA GUEVARA', //------>  Cambiar esto por variable del nombre del profesor
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Roboto-Bold',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Física 2',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange[800],
              fontSize: 30,
              fontFamily: 'Roboto-Regular',
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center, //--------> Cambiar estrellas por el ranking
            children: [
              Icon(Icons.star, size: 50, color: Colors.yellow[600]),
              Icon(Icons.star, size: 50, color: Colors.yellow[600]),
              Icon(Icons.star, size: 50, color: Colors.yellow[600]),
              Icon(Icons.star, size: 50, color: Colors.yellow[100]),
              Icon(Icons.star, size: 50, color: Colors.yellow[100]),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit. Maecenas venenatis est consectetur '
              'interdum dictum. Nunc ante lectus, laoreet eget tellus id, '
              'tincidunt pulvinar mi. Maecenas tincidunt tristique diam, id ',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
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
