import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imdb/Data/detailsFile.dart';
import 'package:imdb/Views/Pages/homePage.dart';
import '../Constant/constants.dart';

Future postSignIn(context) async {
  Movie movie;

  String url =
      'https://grocere-online.com/store/api/customer/login?email=ajanth@gmail.com&password=123456&token=true';

  try {
    final response = await http.post(url, headers: {}, body: {});

    if (response.statusCode == 200) {
      final resMovies = json.decode(response.body);
      print(resMovies);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      print('Error while fetching API');
    }
  } catch (e) {
    print(e);
  }

  return movie;
}
