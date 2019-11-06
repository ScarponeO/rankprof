import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StarFeedback5 extends StatefulWidget {
  @override
  _StarFeedback5State createState() => _StarFeedback5State();
}

class _StarFeedback5State extends State<StarFeedback5> {
  var sliderValue = 0.0;
  IconData myFeedback1= FontAwesomeIcons.star,myFeedback2= FontAwesomeIcons.star,myFeedback3= FontAwesomeIcons.star,
      myFeedback4= FontAwesomeIcons.star,myFeedback5 = FontAwesomeIcons.star;
  Color myFeedbackColor1 = Colors.grey,myFeedbackColor2 = Colors.grey,myFeedbackColor3 = Colors.grey,
      myFeedbackColor4 = Colors.grey,myFeedbackColor5 = Colors.grey;







  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          _myAppBar(),
          Container(
            color: Color(0xffE5E5E5),
            child: Column(
              children: <Widget>[
                Container(child:Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(child: Text("5. Disponibilidad",      //--------> Titulo de la aptitud
                    style: TextStyle(color: Colors.black, fontSize: 22.0,fontWeight:FontWeight.bold),)),
                ),),
                SizedBox(height:30.0),
                Container(
                  child: Align(
                    child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Container(
                          width: 350.0,
                          height: 350.0,
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: StarWidget(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(child: Slider(      //--------> Slider
                                min: 0.0,
                                max: 5.0,
                                divisions: 5,
                                value: sliderValue,
                                inactiveColor: Colors.blueGrey,
                                onChanged: (newValue) {
                                  setState(() {             //--------------> A partir de aqui se encuentran las condiciones para que las estrellas se marquen
                                    sliderValue = newValue;
                                    if (sliderValue == 1.0 ) {
                                      myFeedback1 = FontAwesomeIcons.solidStar;
                                      myFeedbackColor1 = Colors.yellow;
                                    }
                                    else if (sliderValue < 1.0 ){
                                      myFeedback1 = FontAwesomeIcons.star;
                                      myFeedbackColor1 = Colors.grey;

                                    }
                                    if (sliderValue == 2.0 ) {
                                      myFeedback2 = FontAwesomeIcons.solidStar;
                                      myFeedbackColor2= Colors.yellow;
                                    }
                                    else if (sliderValue < 2.0 ){
                                      myFeedback2 = FontAwesomeIcons.star;
                                      myFeedbackColor2 = Colors.grey;

                                    }
                                    if (sliderValue == 3.0 ) {
                                      myFeedback3 = FontAwesomeIcons.solidStar;
                                      myFeedbackColor3 = Colors.yellow;
                                    }
                                    else if (sliderValue < 3.0 ){
                                      myFeedback3 = FontAwesomeIcons.star;
                                      myFeedbackColor3 = Colors.grey;

                                    }
                                    if (sliderValue == 4.0 ) {
                                      myFeedback4 = FontAwesomeIcons.solidStar;
                                      myFeedbackColor4 = Colors.yellow;
                                    }
                                    else if (sliderValue < 4.0 ){
                                      myFeedback4 = FontAwesomeIcons.star;
                                      myFeedbackColor4 = Colors.grey;

                                    }
                                    if (sliderValue == 5.0 ) {
                                      myFeedback5 = FontAwesomeIcons.solidStar;
                                      myFeedbackColor5 = Colors.yellow;
                                    }
                                    else if (sliderValue < 5.0 ){
                                      myFeedback5 = FontAwesomeIcons.star;
                                      myFeedbackColor5 = Colors.grey;

                                    }

                                  });
                                },
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(child: Text("Puntuacion : $sliderValue",    //------> Puntuacion del ranking
                                style: TextStyle(color: Colors.black, fontSize: 22.0,fontWeight:FontWeight.bold),)),
                            ),


                            Padding(padding: const EdgeInsets.all(8.0),

                              child: Text(      //---------> Descripcion de la aptitud
                                  'El profesor ofrece horas de consulta o tiempo dirigido para resolver dudas' ,style: TextStyle(color: Colors.black)),
                            ) ,

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(child: Align(
                                alignment: Alignment.bottomCenter,    //---------> Boton para finalizar ranking
                                child: RaisedButton(
                                  shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                  color: Color(0x802196F3),
                                  child: Text('Enviar',
                                    style: TextStyle(color: Color(0xffffffff)),),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/home');   //------------> Ruta Siguiente

                                  },
                                ),
                              )),
                            ),

                          ],)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }







  List<Widget> StarWidget(){
    List<Widget> myContainer = new List();
    myContainer.add(Container(child: Icon(
      myFeedback1, color: myFeedbackColor1, size: 50.0,)));
    myContainer.add(Container(child: Icon(
      myFeedback2, color: myFeedbackColor2, size: 50.0,)));
    myContainer.add(Container(child: Icon(
      myFeedback3, color: myFeedbackColor3, size: 50.0,)));
    myContainer.add(Container(child: Icon(
      myFeedback4, color: myFeedbackColor4, size: 50.0,)));
    myContainer.add(Container(child: Icon(
      myFeedback5, color: myFeedbackColor5, size: 50.0,)));
    return myContainer;
  }






  Widget _myAppBar() {
    return Container(
      height: 70.0,
      width: MediaQuery
          .of(context)
          .size
          .width,

      decoration: BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            const Color(0x802196F3),
            const Color(0x802196FF),
          ],
          begin: Alignment.centerRight,
          end: new Alignment(-1.0, -1.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child:Container(child:Text('       RankProf', style:
                  TextStyle(

                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0
                  ),),),),
              ],)
        ),
      ),
    );
  }
}