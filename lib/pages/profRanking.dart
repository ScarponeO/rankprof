import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rankprof/pages/starfeedback2.dart';

class Profesor extends StatelessWidget {
  final double puntotal;

  Profesor({this.puntotal}) : super();

  /*void funcionIcono()
  {
    if(this.puntotal == null)
      {
        myFeedback = FontAwesomeIcons.sadTear;
        myFeedbackColor = Colors.red[700];
        myFeedbackText = "Puntuación total: 0";
      }
    if(this.puntotal >=(1) && this.puntotal <2)
      {
        myFeedback = FontAwesomeIcons.sadTear;
        myFeedbackColor = Colors.red[700];
        myFeedbackText = "Puntuación total: 1";
      } if(this.puntotal >=2 && this.puntotal <3)
        {
          myFeedback = FontAwesomeIcons.frown;
          myFeedbackColor = Colors.amber;
          myFeedbackText = "Puntuación total: 2";
        }
    if(this.puntotal >=3 && this.puntotal <4)
      {
        myFeedback = FontAwesomeIcons.check;
        myFeedback = FontAwesomeIcons.meh;
        myFeedbackColor = Colors.yellow;
        myFeedbackText = "Puntuación total: 3";
      } if(this.puntotal >=4 && this.puntotal <5)
        {
          myFeedback = FontAwesomeIcons.smile;
          myFeedbackColor =
              Colors.lightGreenAccent;
          myFeedbackText = "Puntuación total: 4";
        } else {

      myFeedback = FontAwesomeIcons.laugh;
      myFeedbackColor = Colors.green;
      myFeedbackText = "Puntuación total: 5";

    }
  } */

  IconData myFeedback = FontAwesomeIcons.meh;
  Color myFeedbackColor = Color(0xff00008b);
  var myFeedbackText = 'Puntuacion total 0';
  double valortotal1 = 1;

  @override
  Widget build(BuildContext context) {
    //funcionIcono();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
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
        children: <Widget>[
          SizedBox(height: 50),
          Text(
            'ANA VERGAS', //------>  Cambiar esto por variable del nombre del profesor
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Roboto-Bold',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Física 1',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange[800],
              fontSize: 30,
              fontFamily: 'Roboto-Regular',
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Icon(
                  myFeedback,
                  color: myFeedbackColor,
                  size: 80.0,
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Text(
              myFeedbackText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 22.0),
            )),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              '',
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StarFeedback2(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
