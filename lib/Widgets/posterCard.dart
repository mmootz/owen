import 'package:flutter/material.dart';

// Had problems with it filling the whole screen
// so set the height on the image
class posterCard extends StatelessWidget {
  //const posterCard({Key? key}) : super(key: key);
  final dynamic moviePoster;

  posterCard(this.moviePoster);

  @override
  Widget build(BuildContext context) {
    return  Image.network(
      moviePoster,
      fit: BoxFit.contain,
      height: 300,
    );
  }
}
