import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget{

  CustomRaisedButton({
    this.child,
    this.color,
    this.radius : 2,
    this.onPressed,
    this.height,
  });

  final Widget child;
  final Color color;
  final double radius;
  final VoidCallback onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}