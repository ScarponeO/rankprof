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
        backgroundColor: Colors.blue[800],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: _buildUserInfo(user),
        ),
      ),
    );
  }

  Widget _buildUserInfo(User user) {
    return Column(
      children: <Widget>[
        Text(
          user.displayName,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Roboto-Regular', fontSize: 25, color: Colors.white),
        ),
        SizedBox(height: 12),
        Avatar(
          photoUrl: user.photoUrl,
          radius: 40,
        ),
        SizedBox(height: 8),

      ],
    );
  }
}
