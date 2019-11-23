import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rankprof/services/auth.dart';
import 'avatar.dart';


class MiUsuario extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

//    final user = Provider.of<User>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Usuario'),
//        bottom: PreferredSize(
//          preferredSize: Size.fromHeight(130),
//          child: _buildUserInfo(user),
//        ),
      ),
    );

  }

  Widget _buildUserInfo(User user) {
    return Avatar(
      photoUrl: user.photoUrl,
      radius: 50,
    );
  }
}
