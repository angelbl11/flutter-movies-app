import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = "api.themoviedb.org";
  String _apiKey = "d0acb52ae1ca69f84c946940b1496274";
  String _language = "es-ES";
  MoviesProvider() {
    print("Movies Provider init");
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {"api_key": _apiKey, "language": _language, "page": "1"});
    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    print(decodedData["results"]);
  }
}
