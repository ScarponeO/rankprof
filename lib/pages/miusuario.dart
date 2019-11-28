import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rankprof/services/auth.dart';
import 'avatar.dart';


class MiUsuario extends StatelessWidget {

  final User user; 
  MiUsuario({Key key, @required this.user}) : super(key: key); 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(user.displayName, textAlign: TextAlign.center,),
        backgroundColor: Colors.blue[800],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: _buildUserInfo(user),
        ),
      ),
    );
  }

  Widget _buildUserInfo(User user) {
    return Avatar(
      photoUrl: user.photoUrl,
      radius: 40,
    );
  }
}
