import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final text;
  final function;

  const MyButton({super.key, this.text, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          height: 50,
          width: 50,
          child: Center(
            child:Text(
            text,
            style: const TextStyle(color: Colors.white,fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}