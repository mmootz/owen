import 'package:flutter/material.dart';

// provides card template for the boxes

class cardStock extends StatelessWidget {
  //const cardStock({Key? key}) : super(key: key);

  final dynamic cardChild;
  cardStock({required this.cardChild});


  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        width:  double.infinity,
        child: cardChild
      ),
    );
  }
}
