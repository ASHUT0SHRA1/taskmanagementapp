import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color backgroundcolor ;
  final String text ;
  final Color textColor ;

  const ButtonWidget({Key? key, required this.backgroundcolor, required this.text, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height/15,
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text(text, style: TextStyle(fontSize: 28,color: textColor),)),
    );
  }
}
