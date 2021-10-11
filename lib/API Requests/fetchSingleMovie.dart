import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imdb/Data/detailsFile.dart';

Future<Movie> getSingleMovie(url) async {
  final response = await http.get(url, headers: {});

  if (response.statusCode == 200) {
    var responseData = jsonDecode(response.body)['results'][0];
    var singleMovie = Movie.fromJson(responseData);

    return singleMovie;
  } else {
    throw Exception('Failed to load album');
  }
}
