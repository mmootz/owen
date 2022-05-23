import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Wow> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://owen-wilson-wow-api.herokuapp.com/wows/random'));

  // final response = await http
  //     .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // debugPrint(response.body.toString());
    final List<dynamic> jsonarray = jsonDecode(response.body);
    //return Album.fromJson(jsonarray[0]);
    return Wow.fromJson(jsonarray[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Wow {
  final dynamic movie;
  final dynamic year;
  final dynamic release;
  final dynamic director;
  final dynamic character;
  final dynamic movieDuration;
  final dynamic timestamp;
  final dynamic fullLine;
  final dynamic wows;
  final dynamic totalWows;
  final String poster;
  final dynamic audio;

  const Wow({
    required this.movie,
    required this.year,
    required this.release,
    required this.character,
    required this.director,
    required this.fullLine,
    required this.movieDuration,
    required this.timestamp,
    required this.totalWows,
    required this.wows,
    required this.poster,
    required this.audio,
  });

  factory Wow.fromJson(Map<String, dynamic> json) {
    // final List<dynamic> videoArray;
    // final dynamic clip;
    // videoArray = jsonDecode(json['Video']);
    // clip = videoArray[3];
    return Wow(
        release: json['release_date'],
        director: json['director'],
        character: json['character'],
        year: json['year'.toString()],
        movie: json['movie'],
        movieDuration: json['movie_duration'],
        timestamp: json['timestamp'],
        fullLine: json['full_line'],
        wows: json['current_wow_in_movie'.toString()],
        totalWows: json['total_wows_in_movie'.toString()],
        poster: json['poster'],
        audio: json['audio']);
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Wow> futureWow;

  void _aWholeNewWow() {
    setState(() {
      futureWow = fetchAlbum();
    });
  }

  @override
  void initState() {
    super.initState();
    futureWow = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wow generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Wow Generator',
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(
          child: FutureBuilder<Wow>(
            future: futureWow,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Card(
                      elevation: 6,
                      margin: EdgeInsets.all(20),
                      child: Container(
                        width: 300,
                        height: 300,
                        child: Image.network(
                          snapshot.data!.poster.toString(),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const Text(
                      "Movie Details",
                      style: TextStyle(fontSize: 22),
                    ),
                    const SizedBox(height: 5),
                    Card(
                      margin: const EdgeInsets.all(5),
                      elevation: 6,
                      child: SizedBox(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Text("Movie: " + snapshot.data?.movie),
                            Row(
                              children: [
                                const Text("Director: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(snapshot.data?.director),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Character: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(snapshot.data?.character),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Full Line: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text("\"" + snapshot.data?.fullLine + "\"",
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic)),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Year: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(snapshot.data!.year.toString()),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Text("Length : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(snapshot.data?.movieDuration),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Wow Details",
                      style: TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Card(
                      margin: const EdgeInsets.all(5),
                      elevation: 6,
                      child: Container(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("Current movie wow: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(snapshot.data!.wows.toString()),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Wow timestamp: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(snapshot.data?.timestamp),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Total wows in movie: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(snapshot.data!.totalWows.toString()),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: _aWholeNewWow,
                        child: Text("A whole new wow"))
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
