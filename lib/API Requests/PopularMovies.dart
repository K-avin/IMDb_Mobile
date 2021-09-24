import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imdb/Data/detailsFile.dart';
import '../Constant/constants.dart';

Future<List<Movie>> getMoviesData() async {
  Movie movie;
  String url =
      baseUrl + 'movie/popular?api_key=' + apiKey + '&language=en-US&page=1';

  final response = await http.get(url, headers: {});

  if (response.statusCode == 200) {
    List responseData = jsonDecode(response.body)['results'];
    return responseData.map((data) => new Movie.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}
