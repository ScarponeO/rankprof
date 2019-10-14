import 'package:flutter/material.dart';
import 'package:rankprof/behaviors/hiddenScrollBehavior.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

   Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    /*PageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PageController(

    );
  }*/


    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _bottomAction(FontAwesomeIcons.history),
            _bottomAction(FontAwesomeIcons.shoePrints),
            _bottomAction(Icons.settings),
          ],
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        children: <Widget>[
        ],
      ),
    );
  }


 /* Widget _selector(){
    return SizedBox.fromSize(
      size: Size.fromHeight(20),
      child: PageView(
        //controller: _controller,
        children: <Widget>[
          Text("Matematicas"),
          Text("Fisica"),
        ],
      ),
    );
  }*/
}