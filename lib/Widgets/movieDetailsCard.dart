import 'package:flutter/material.dart';


class movieDetails extends StatelessWidget {
  const movieDetails(
      {Key? key,
      required this.movieDirector,
      required this.movieCharacter,
      required this.movieFullLine,
      required this.movieYear,
      required this.movieLength})
      : super(key: key);

  final String movieDirector;
  final String movieCharacter;
  final String movieFullLine;
  final String movieYear;
  final String movieLength;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              const Text("Director: ",
                  style:
                  TextStyle(fontWeight: FontWeight.bold)),
              Text(movieDirector),
            ],
          ),
          Row(
            children: [
              const Text("Character: ",
                  style:
                  TextStyle(fontWeight: FontWeight.bold)),
              Text(movieCharacter),
            ],
          ),
          Row(
            children: [
              const Text("Full Line: ",
                  style:
                  TextStyle(fontWeight: FontWeight.bold)),
              Text("\"" + movieFullLine + "\"",
                  style:
                  TextStyle(fontStyle: FontStyle.italic)),
            ],
          ),
          Row(
            children: [
              const Text("Year: ",
                  style:
                  TextStyle(fontWeight: FontWeight.bold)),
              Text(movieYear),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  const Text("Length : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text(movieLength),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
