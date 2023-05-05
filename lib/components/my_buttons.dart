import 'dart:ffi';

import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback buttonOnpressed;

  const MyButtons(
      {Key? key, required this.title, this.color= Colors.grey,required this.buttonOnpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          onTap: buttonOnpressed,
          child: Container(
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color
              ),
              child: Center(
                child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              )),
        ),
      ),
    );
  }
}
