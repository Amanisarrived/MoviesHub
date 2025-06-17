import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(255, 199, 0, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 150, vertical: 18),
      ),
      child: Text(
        "BookMark",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(17, 17, 17, 1),
        ),
      ),
    );
  }
}
