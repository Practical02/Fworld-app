import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:function_world_app/widgets/fav_tiles.dart';

import 'package:http/http.dart' as http;

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  late Future<List<Album>> pics;

  Future<List<Album>> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://picsum.photos/v2/list?page=2&limit=5'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      List<Album> albums =
          jsonResponse.map((item) => Album.fromJson(item)).toList();
      return albums;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    pics = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/icons/History.png"),
                height: 16,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Recent Favourites",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Album>>(
            future: pics,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return MasonryGridView.count(
                  crossAxisCount: 2,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                        onTap: () {
                          // Handle tap
                        },
                        child: FavTile(
                          imageUrl: snapshot.data![index].url,
                          title: "Test Heading 1",
                          subTitle: "Test sub heading 348u73",
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class Album {
  final String id;
  final String url;

  Album({
    required this.id,
    required this.url,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as String,
      url: json['download_url'] as String,
    );
  }
}
