// File: lib/details_screen.dart
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['name'] ?? 'Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie['image']?['medium'] ?? '',
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
            SizedBox(height: 16),
            Text(
              movie['name'] ?? 'No title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(movie['summary'] ?? 'No summary available'),
          ],
        ),
      ),
    );
  }
}
