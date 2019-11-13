import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';


class LogicaRankeo extends StatefulWidget {



      final double aptitud1;
      final double aptitud2;
      final double aptitud3;
      final double aptitud4;
      final double aptitud5;

  LogicaRankeo({this.aptitud1, this.aptitud2, this.aptitud3, this.aptitud4, this.aptitud5}) :
        super();






  @override
  State<StatefulWidget> createState() => _LogicaRankeoState();
}

class _LogicaRankeoState extends State<LogicaRankeo> {

  void imprimir(){
    prefix0.print("Meperdonas");
    print(widget.aptitud1);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


    );
  }



}
