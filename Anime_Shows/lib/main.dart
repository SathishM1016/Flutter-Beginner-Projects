import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimeApp(

    ),
  ));
}

class Show {
  int Id;
  String title;
  String imageUrl;
  double score;

  Show({
    required this.Id,
    required this.title,
    required this.imageUrl,
    required this.score,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      Id: json['_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      score: json['score'],
    );
  }
}

Future<List<Show>> fetchShows() async {
  final response =
  await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1'));

  if (response.statusCode == 200) {
    var topShowsJson = jsonDecode(response.body)['top'] as List;
    print (response.body);
    return topShowsJson.map((show) => Show.fromJson(show)).toList();
  } else {
    throw Exception('Failed to load shows');
  }
}

class AnimeApp extends StatefulWidget {
  AnimeApp({Key? key}) : super(key: key);

  @override
  _AnimeAppState createState() => _AnimeAppState();
}

class _AnimeAppState extends State<AnimeApp> {
  late Future<List<Show>> shows;

  @override
  void initState() {
    super.initState();
    shows = fetchShows();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cartoon',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xfff8f8f8),
              title: Text('Cartoon Shows',
                style: TextStyle(color: Colors.black,fontSize: 25.0),
              )
          ),
            body: Center(
              child: FutureBuilder(
                future: shows,
                builder: (context, AsyncSnapshot<List<Show>> snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 160.0,width: 120.0,
                           child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                NetworkImage('${snapshot.data?[index].imageUrl}'),
                              ),
                              title: Text('${snapshot.data?[index].title}'),
                              subtitle: Text('Rating: ${snapshot.data?[index].score}'),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong :('));
                  }

                  return CircularProgressIndicator();
                },
              ),
      ),
    ),
    );
  }
}
