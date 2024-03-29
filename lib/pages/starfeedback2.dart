import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rankprof/behaviors/hiddenScrollBehavior.dart';
import 'package:rankprof/services/auth.dart';

import 'landingPage.dart';

class StarFeedback2 extends StatefulWidget {
  final double valor1;
  final double valor2;
  final double valor3;
  final double valor4;
  final double valor5;
  final double totalranking;
  final String idenviar;
  final double contt;
  final String superusuario;
  final String materiaa;
  final String profesor;

  const StarFeedback2({
    Key key,
    this.valor1,
    this.valor2,
    this.valor3,
    this.valor4,
    this.valor5,
    this.totalranking,
    this.contt,
    this.idenviar, this.superusuario, this.materiaa, this.profesor,
  }) : super(key: key);

  @override
  _StarFeedback2State createState() => _StarFeedback2State();
}

class _StarFeedback2State extends State<StarFeedback2> {
  final databaseReference = Firestore.instance;

  void updateData() {
    try {
      databaseReference
          .collection('Profesores')
          .document(widget.idenviar)
          .updateData({
        'disponibilidad': enviar1,
        'exigencia': enviar2,
        'interacción': enviar3,
        'pedagogía': enviar4,
        'responsabilidad': enviar5,
        'contador': contador,
        'total': enviartotal,
        'acudisponibilidad': enviaracumulador1,
        'acuexigencia': enviaracumulador2,
        'acuinteracción': enviaracumulador3,
        'acupedagogía': enviaracumulador4,
        'acuresponsabilidad': enviaracumulador5
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        //IF para evitar que el usuario deje alguna aptitud sin ranquear.
        if (sliderValue == 0.0 ||
            sliderValue2 == 0.0 ||
            sliderValue3 == 0.0 ||
            sliderValue4 == 0.0 ||
            sliderValue5 == 0.0) {
          return AlertDialog(
            title: new Text("Debes llenar todas las aptitudes"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Aceptar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        } else {
          return AlertDialog(
            title: new Text("Seguro que deseas enviar el ranking?" +
                "\n\nPuntuación total = " +
                puntuacionTotal.toString()),
            content: new Text(
              "Disponibilidad = " +
                  valorAptitud1.toString() +
                  "\nExigencia académica = " +
                  valorAptitud2.toString() +
                  "\nInteracción = " +
                  valorAptitud3.toString() +
                  "\nPedagogíar = " +
                  valorAptitud4.toString() +
                  "\nResponsabilidad = " +
                  valorAptitud5.toString(),
              style: TextStyle(fontSize: 15.0, fontFamily: 'Roboto-Regular'),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Cerrar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text("Enviar"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LandingPage(),
                      ));
                },
              ),
            ],
          );
        }
      },
    );
  }

  void promedio() {
    puntuacionTotal = (valorAptitud1 +
            valorAptitud2 +
            valorAptitud3 +
            valorAptitud4 +
            valorAptitud5) /
        5;
  }

  void logica() {
    contador = widget.contt + 1;
    enviar1 = (valorAptitud1 + widget.valor1) / contador;
    enviar2 = (valorAptitud2 + widget.valor2) / contador;
    enviar3 = (valorAptitud3 + widget.valor3) / contador;
    enviar4 = (valorAptitud4 + widget.valor4) / contador;
    enviar5 = (valorAptitud5 + widget.valor5) / contador;

    enviaracumulador1 = widget.valor1 + valorAptitud1;
    enviaracumulador2 = widget.valor2 + valorAptitud2;
    enviaracumulador3 = widget.valor3 + valorAptitud3;
    enviaracumulador4 = widget.valor4 + valorAptitud4;
    enviaracumulador5 = widget.valor5 + valorAptitud5;

    enviartotal = (enviar1 + enviar2 + enviar3 + enviar4 + enviar5) / 5;
  }

  //VARIABLES PARA LA LOGICA

  double enviar1 = 0;
  double enviar2 = 0;
  double enviar3 = 0;
  double enviar4 = 0;
  double enviar5 = 0;
  double enviartotal = 0;
  double contador = 0;
  double enviaracumulador1;
  double enviaracumulador2;
  double enviaracumulador3;
  double enviaracumulador4;
  double enviaracumulador5;

  //VARIABLES PARA LA PRIMERA APTITUD

  IconData myFeedback = FontAwesomeIcons.award;
  Color myFeedbackColor = Color(0xff00008b);
  var myFeedbackText = "Rankea a tu profesor";
  var instruccion = "Desliza el slider para rankear";
  var sliderValue = 0.0;
  double valorAptitud1 = 0.0;

  //VARIABLES PARA LA SEGUNDA APTITUD

  IconData myFeedback2 = FontAwesomeIcons.award;
  Color myFeedbackColor2 = Color(0xff00008b);
  var myFeedbackText2 = "Rankea a tu profesor";
  var instruccion2 = "Desliza el slider para rankear";
  var sliderValue2 = 0.0;
  double valorAptitud2 = 0.0;

  //VARIABLES PARA LA TERCERA APTITUD

  IconData myFeedback3 = FontAwesomeIcons.award;
  Color myFeedbackColor3 = Color(0xff00008b);
  var myFeedbackText3 = "Rankea a tu profesor";
  var instruccion3 = "Desliza el slider para rankear";
  var sliderValue3 = 0.0;
  double valorAptitud3 = 0.0;
  //VARIABLES PARA LA CUARTA APTITUD

  IconData myFeedback4 = FontAwesomeIcons.award;
  Color myFeedbackColor4 = Color(0xff00008b);
  var myFeedbackText4 = "Rankea a tu profesor";
  var instruccion4 = "Desliza el slider para rankear";
  var sliderValue4 = 0.0;
  double valorAptitud4 = 0.0;
  //VARIABLES PARA LA QUINTA APTITUD

  IconData myFeedback5 = FontAwesomeIcons.award;
  Color myFeedbackColor5 = Color(0xff00008b);
  var myFeedbackText5 = "Rankea a tu profesor";
  var instruccion5 = "Desliza el slider para rankear";
  var sliderValue5 = 0.0;
  double valorAptitud5 = 0.0;

  double puntuacionTotal = 0.0;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return new Scaffold(
      appBar: AppBar(
        title: const Text(
          'RankProf',
          style: TextStyle(
            fontFamily: 'Satisfy',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25.0,
          ),
        ),
        backgroundColor: Color(0xff00008b),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              //
            }),
        actions: <Widget>[],
      ),
      body: Container(
        color: Color(0xff00008b),
        child: ScrollConfiguration(
          behavior: HiddenScrollBehavior(),
          child: ListView(
            children: <Widget>[
              //CONTAINER PARA LA PRIMERA APTITUD
              SizedBox(
                  height:
                      10), //------------> Agregue esta caja para que haya mas espacio entre el appbar y el rnking
              Container(
                margin: const EdgeInsets.only(top: 0.0, right: 0),
                child: Align(
                  child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                        width: 350.0,
                        height: 350.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                  child: Text(
                                "DISPONIBILIDAD",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto-Bold'),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  //--------> Descripcion de las aptitudes
                                  'El profesor ofrece horas de consulta o tiempo dirigido para resolver dudas.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontFamily: 'Roboto')),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Text(
                                myFeedbackText,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22.0),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Icon(
                                myFeedback,
                                color: myFeedbackColor,
                                size: 80.0,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Slider(
                                  min: 0.0,
                                  max: 10.0,
                                  divisions: 5,
                                  value: sliderValue,
                                  activeColor: Colors.blue[800],
                                  inactiveColor: Colors.blueGrey,
                                  onChanged: (newValue) {
                                    setState(() {
                                      sliderValue = newValue;
                                      if (sliderValue == 0.0) {
                                        myFeedback = FontAwesomeIcons.sadTear;
                                        myFeedbackColor = Color(0xff00008b);
                                        myFeedbackText = "Puntuación: 0";
                                        instruccion =
                                            "Recuerda que debes rankear";
                                        valorAptitud1 = 0;
                                      }
                                      if (sliderValue > 0.0 &&
                                          sliderValue <= 2.0) {
                                        myFeedback = FontAwesomeIcons.sadTear;
                                        myFeedbackColor = Colors.red[700];
                                        myFeedbackText = "Puntuación: 1";
                                        instruccion = " ";
                                        valorAptitud1 = 1;
                                      }
                                      if (sliderValue >= 2.1 &&
                                          sliderValue <= 4.0) {
                                        myFeedback = FontAwesomeIcons.frown;
                                        myFeedbackColor = Colors.amber;
                                        myFeedbackText = "Puntuación: 2";
                                        valorAptitud1 = 2;
                                      }
                                      if (sliderValue >= 4.1 &&
                                          sliderValue <= 6.0) {
                                        myFeedback = FontAwesomeIcons.meh;
                                        myFeedbackColor = Colors.yellow;
                                        myFeedbackText = "Puntuación: 3";
                                        valorAptitud1 = 3;
                                      }
                                      if (sliderValue >= 6.1 &&
                                          sliderValue <= 8.0) {
                                        myFeedback = FontAwesomeIcons.smile;
                                        myFeedbackColor =
                                            Colors.lightGreenAccent;
                                        myFeedbackText = "Puntuación: 4";
                                        valorAptitud1 = 4;
                                      }
                                      if (sliderValue >= 8.1 &&
                                          sliderValue <= 10.0) {
                                        myFeedback = FontAwesomeIcons.laugh;
                                        myFeedbackColor = Colors.green;
                                        myFeedbackText = "Puntuación: 5";
                                        valorAptitud1 = 5;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Text(
                                instruccion,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              )),
                            ),
                          ],
                        )),
                  ),
                ),
              ),

              //CONTAINER PARA LA SEGUNDA APTITUD
              Container(
                margin: const EdgeInsets.only(top: 15.0, right: 0),
                child: Align(
                  child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                        width: 350.0,
                        height: 350.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                  child: Text(
                                "EXIGENCIA ACADEMICA",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  //--------> Descripcion de las aptitudes
                                  'Pide a los estudiantes hacer lo mejor posible en cada actividad.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Text(
                                myFeedbackText2,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22.0),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Icon(
                                myFeedback2,
                                color: myFeedbackColor2,
                                size: 80.0,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Slider(
                                  min: 0.0,
                                  max: 10.0,
                                  divisions: 5,
                                  value: sliderValue2,
                                  activeColor: Colors.blue[800],
                                  inactiveColor: Colors.blueGrey,
                                  onChanged: (newValue) {
                                    setState(() {
                                      sliderValue2 = newValue;
                                      if (sliderValue2 == 0.0) {
                                        myFeedback2 = FontAwesomeIcons.sadTear;
                                        myFeedbackColor2 = Color(0xff00008b);
                                        myFeedbackText2 = "Puntuación: 0";
                                        instruccion2 =
                                            "Recuerda que debes rankear";
                                        valorAptitud2 = 0;
                                      }
                                      if (sliderValue2 > 0.0 &&
                                          sliderValue2 <= 2.0) {
                                        myFeedback2 = FontAwesomeIcons.sadTear;
                                        myFeedbackColor2 = Colors.red;
                                        myFeedbackText2 = "Puntuación: 1";
                                        instruccion2 = " ";
                                        valorAptitud2 = 1;
                                      }
                                      if (sliderValue2 >= 2.1 &&
                                          sliderValue2 <= 4.0) {
                                        myFeedback2 = FontAwesomeIcons.frown;
                                        myFeedbackColor2 = Colors.amber;
                                        myFeedbackText2 = "Puntuación: 2";
                                        valorAptitud2 = 2;
                                      }
                                      if (sliderValue2 >= 4.1 &&
                                          sliderValue2 <= 6.0) {
                                        myFeedback2 = FontAwesomeIcons.meh;
                                        myFeedbackColor2 = Colors.yellow;
                                        myFeedbackText2 = "Puntuación: 3";
                                        valorAptitud2 = 3;
                                      }
                                      if (sliderValue2 >= 6.1 &&
                                          sliderValue2 <= 8.0) {
                                        myFeedback2 = FontAwesomeIcons.smile;
                                        myFeedbackColor2 =
                                            Colors.lightGreenAccent;
                                        myFeedbackText2 = "Puntuación: 4";
                                        valorAptitud2 = 4;
                                      }
                                      if (sliderValue2 >= 8.1 &&
                                          sliderValue2 <= 10.0) {
                                        myFeedback2 = FontAwesomeIcons.laugh;
                                        myFeedbackColor2 = Colors.green;
                                        myFeedbackText2 = "Puntuación: 5";
                                        valorAptitud2 = 5;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Text(
                                instruccion2,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              )),
                            ),
                          ],
                        )),
                  ),
                ),
              ),

              //CONTAINER PARA LA TERCERA APTITUD
              Container(
                margin: const EdgeInsets.only(top: 15.0, right: 0),
                child: Align(
                  child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                        width: 350.0,
                        height: 360.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                  child: Text(
                                "INTERACCION",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  //--------> Descripcion de las aptitudes
                                  'Forma de dirigirse con el estudiante, amabilidad del profesor, lenguaje con el que se expresa en clases.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Text(
                                myFeedbackText3,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22.0),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Icon(
                                myFeedback3,
                                color: myFeedbackColor3,
                                size: 80.0,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Slider(
                                  min: 0.0,
                                  max: 10.0,
                                  divisions: 5,
                                  value: sliderValue3,
                                  activeColor: Colors.blue[800],
                                  inactiveColor: Colors.blueGrey,
                                  onChanged: (newValue) {
                                    setState(() {
                                      sliderValue3 = newValue;
                                      if (sliderValue3 == 0.0) {
                                        myFeedback3 = FontAwesomeIcons.sadTear;
                                        myFeedbackColor3 = Color(0xff00008b);
                                        myFeedbackText3 = "Puntuación: 0";
                                        instruccion3 =
                                            "Recuerda que debes rankear";
                                        valorAptitud3 = 0;
                                      }
                                      if (sliderValue3 > 0.0 &&
                                          sliderValue3 <= 2.0) {
                                        myFeedback3 = FontAwesomeIcons.sadTear;
                                        myFeedbackColor3 = Colors.red;
                                        myFeedbackText3 = "Puntuación: 1";
                                        instruccion3 = " ";
                                        valorAptitud3 = 1;
                                      }
                                      if (sliderValue3 >= 2.1 &&
                                          sliderValue3 <= 4.0) {
                                        myFeedback3 = FontAwesomeIcons.frown;
                                        myFeedbackColor3 = Colors.amber;
                                        myFeedbackText3 = "Puntuación: 2";
                                        valorAptitud3 = 2;
                                      }
                                      if (sliderValue3 >= 4.1 &&
                                          sliderValue3 <= 6.0) {
                                        myFeedback3 = FontAwesomeIcons.meh;
                                        myFeedbackColor3 = Colors.yellow;
                                        myFeedbackText3 = "Puntuación: 3";
                                        valorAptitud3 = 3;
                                      }
                                      if (sliderValue3 >= 6.1 &&
                                          sliderValue3 <= 8.0) {
                                        myFeedback3 = FontAwesomeIcons.smile;
                                        myFeedbackColor3 =
                                            Colors.lightGreenAccent;
                                        myFeedbackText3 = "Puntuación: 4";
                                        valorAptitud3 = 4;
                                      }
                                      if (sliderValue3 >= 8.1 &&
                                          sliderValue3 <= 10.0) {
                                        myFeedback3 = FontAwesomeIcons.laugh;
                                        myFeedbackColor3 = Colors.green;
                                        myFeedbackText3 = "Puntuación: 5";
                                        valorAptitud3 = 5;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Text(
                                instruccion3,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              )),
                            ),
                          ],
                        )),
                  ),
                ),
              ),

              //CONTAINER PARA LA CUARTA APTITUD
              Container(
                margin: const EdgeInsets.only(top: 15.0, right: 0),
                child: Align(
                  child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                        width: 350.0,
                        height: 360.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                  child: Text(
                                "PEDAGOGÍA",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  //--------> Descripcion de las aptitudes
                                  'Práctica educativa o método de enseñanza, claridad con la que expresa sus ideas a la clase.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Text(
                                myFeedbackText4,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22.0),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Icon(
                                myFeedback4,
                                color: myFeedbackColor4,
                                size: 80.0,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Slider(
                                  min: 0.0,
                                  max: 10.0,
                                  divisions: 5,
                                  value: sliderValue4,
                                  activeColor: Colors.blue[800],
                                  inactiveColor: Colors.blueGrey,
                                  onChanged: (newValue) {
                                    setState(() {
                                      sliderValue4 = newValue;
                                      if (sliderValue4 == 0.0) {
                                        myFeedback4 = FontAwesomeIcons.sadTear;
                                        myFeedbackColor4 = Color(0xff00008b);
                                        myFeedbackText4 = "Puntuación: 0";
                                        instruccion4 =
                                            "Recuerda que debes rankear";
                                        valorAptitud4 = 0;
                                      }
                                      if (sliderValue4 > 0.0 &&
                                          sliderValue4 <= 2.0) {
                                        myFeedback4 = FontAwesomeIcons.sadTear;
                                        myFeedbackColor4 = Colors.red;
                                        myFeedbackText4 = "Puntuación: 1";
                                        instruccion4 = " ";
                                        valorAptitud4 = 1;
                                      }
                                      if (sliderValue4 >= 2.1 &&
                                          sliderValue4 <= 4.0) {
                                        myFeedback4 = FontAwesomeIcons.frown;
                                        myFeedbackColor4 = Colors.amber;
                                        myFeedbackText4 = "Puntuación: 2";
                                        valorAptitud4 = 2;
                                      }
                                      if (sliderValue4 >= 4.1 &&
                                          sliderValue4 <= 6.0) {
                                        myFeedback4 = FontAwesomeIcons.meh;
                                        myFeedbackColor4 = Colors.yellow;
                                        myFeedbackText4 = "Puntuación: 3";
                                        valorAptitud4 = 3;
                                      }
                                      if (sliderValue4 >= 6.1 &&
                                          sliderValue4 <= 8.0) {
                                        myFeedback4 = FontAwesomeIcons.smile;
                                        myFeedbackColor4 =
                                            Colors.lightGreenAccent;
                                        myFeedbackText4 = "Puntuación: 4";
                                        valorAptitud4 = 4;
                                      }
                                      if (sliderValue4 >= 8.1 &&
                                          sliderValue4 <= 10.0) {
                                        myFeedback4 = FontAwesomeIcons.laugh;
                                        myFeedbackColor4 = Colors.green;
                                        myFeedbackText4 = "Puntuación: 5";
                                        valorAptitud4 = 5;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Text(
                                instruccion4,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              )),
                            ),
                          ],
                        )),
                  ),
                ),
              ),

              //CONTAINER PARA LA QUINTA APTITUD
              Container(
                margin: const EdgeInsets.only(top: 15.0, right: 0),
                child: Align(
                  child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                        width: 350.0,
                        height: 360.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                  child: Text(
                                "RESPONSABILIDAD",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  //--------> Descripcion de las aptitudes
                                  'Puntualidad a la hora de clases, en la entrega de notas y de material académico.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Text(
                                myFeedbackText5,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22.0),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Icon(
                                myFeedback5,
                                color: myFeedbackColor5,
                                size: 80.0,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Slider(
                                  min: 0.0,
                                  max: 10.0,
                                  divisions: 5,
                                  value: sliderValue5,
                                  activeColor: Colors.blue[800],
                                  inactiveColor: Colors.blueGrey,
                                  onChanged: (newValue) {
                                    setState(() {
                                      sliderValue5 = newValue;
                                      if (sliderValue5 == 0.0) {
                                        myFeedback5 = FontAwesomeIcons.sadTear;
                                        myFeedbackColor5 = Color(0xff00008b);
                                        myFeedbackText5 = "Puntuación: 0";
                                        instruccion5 =
                                            "Recuerda que debes rankear";
                                        valorAptitud5 = 0;
                                      }
                                      if (sliderValue5 > 0.0 &&
                                          sliderValue5 <= 2.0) {
                                        myFeedback5 = FontAwesomeIcons.sadTear;
                                        myFeedbackColor5 = Colors.red;
                                        myFeedbackText5 = "Puntuación: 1";
                                        instruccion5 = " ";
                                        valorAptitud5 = 1;
                                      }
                                      if (sliderValue5 >= 2.1 &&
                                          sliderValue5 <= 4.0) {
                                        myFeedback5 = FontAwesomeIcons.frown;
                                        myFeedbackColor5 = Colors.amber;
                                        myFeedbackText5 = "Puntuación: 2";
                                        valorAptitud5 = 2;
                                      }
                                      if (sliderValue5 >= 4.1 &&
                                          sliderValue5 <= 6.0) {
                                        myFeedback5 = FontAwesomeIcons.meh;
                                        myFeedbackColor5 = Colors.yellow;
                                        myFeedbackText5 = "Puntuación: 3";
                                        valorAptitud5 = 3;
                                      }
                                      if (sliderValue5 >= 6.1 &&
                                          sliderValue5 <= 8.0) {
                                        myFeedback5 = FontAwesomeIcons.smile;
                                        myFeedbackColor5 =
                                            Colors.lightGreenAccent;
                                        myFeedbackText5 = "Puntuación: 4";
                                        valorAptitud5 = 4;
                                      }
                                      if (sliderValue5 >= 8.1 &&
                                          sliderValue5 <= 10.0) {
                                        myFeedback5 = FontAwesomeIcons.laugh;
                                        myFeedbackColor5 = Colors.green;
                                        myFeedbackText5 = "Puntuación: 5";
                                        valorAptitud5 = 5;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Text(
                                instruccion5,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              )),
                            ),
                          ],
                        )),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.blue[800],
                    child: Text(
                      '           Enviar ranking           ',
                      style:
                          TextStyle(color: Color(0xffffffff), fontSize: 18.0),
                    ),
                    onPressed: () {
                      promedio();
                      logica();
                      _showDialog();
                      updateData();
                      print(puntuacionTotal);
                      Firestore.instance
                          .collection('Usuarios')
                          .document()
                          .setData({
                        "Id": widget.idenviar,
                        "R.disponibilidad": sliderValue / 2,
                        "R.exigencia": sliderValue2 / 2,
                        "R.interaccion": sliderValue3 / 2,
                        "R.pedagogia": sliderValue4 / 2,
                        "R.responsabilidad": sliderValue5 / 2,
                        "tota": puntuacionTotal,
                        "name":widget.superusuario,
                        "materia": widget.materiaa,
                        "profesor": widget.profesor,
                      });
                    },
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
