import 'package:flutter/material.dart';

class Description extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final star = Container(

      margin: EdgeInsets.only(

        top: 323.0,
        right: 3.0,


      ),

      child: Icon(

        Icons.star,
        color: Color(0xFFf2C611),
        size: 20,

      ),

    );

    final description = Container(

      margin: EdgeInsets.only(

          right: 100.0,
          left: 25.0,
          top: 10.0

      ),
      child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In hendrerit tellus in diam ullamcorper sodales.",
          textAlign: TextAlign.left,
          style: TextStyle(

              fontWeight: FontWeight.w200,
              fontSize: 15.0,
              letterSpacing: 0.5

          )

      ),

    );

    final titleStars = Row(

        children: <Widget>[

          Container(

            margin: EdgeInsets.only(

              top: 323.0,
              left: 20.0,
              right: 20.0,

            ),

            child: Text(

              "Duwili Ella",
              textAlign: TextAlign.left,
              style: TextStyle(

                fontSize: 30.0,
                fontWeight: FontWeight.w900,

              ),

            ),

          ),

          Row(

            children: <Widget>[

              star,
              star,
              star,
              star,
              star,

            ],

          ),


        ]

    );




    final screen = Column(

      /* margin: EdgeInsets.only(

          top: 320.0,
          right: 20.0,
          left: 20.0,
        ),*/

      children: <Widget>[


        titleStars,
        description


      ],

    );

    return screen;

  }

}```