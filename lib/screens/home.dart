// File: lib/home_screen.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'details_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  void fetchMovies() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
    if (response.statusCode == 200) {
      setState(() {
        movies = jsonDecode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          )
        ],
      ),
      body: movies.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index]['show'];
                return ListTile(
                  leading: Image.network(
                    movie['image']?['medium'] ?? '',
                    width: 50,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                  ),
                  title: Text(movie['name']),
                  subtitle: Text(movie['summary'] ?? 'No summary available'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(movie: movie),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
