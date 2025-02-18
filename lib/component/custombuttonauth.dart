import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButtonAuth({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
    );
  }
}



