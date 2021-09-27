import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imdb/API%20Requests/fetchSingleMovie.dart';
import 'package:imdb/Constant/constants.dart';
import 'package:imdb/Data/detailsFile.dart';
import 'package:imdb/config.dart';
import '../../API Requests/PopularMovies.dart';

import 'detailsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Movie>> popularMovies;
  Future<List<Movie>> trendingMovies;
  Future<Movie> singleMovie;

  String urlPopular =
      baseUrl + 'movie/popular?api_key=' + apiKey + '&language=en-US&page=1';
  String urlTrening = baseUrl +
      'movie/now_playing?api_key=' +
      apiKey +
      '&language=en-US&page=1';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleMovie = getSingleMovie(urlPopular);
    popularMovies = getMoviesData(urlPopular);
    trendingMovies = getMoviesData(urlTrening);
    print(singleMovie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Text(
              "Move",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "ez",
              style: TextStyle(
                color: primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: secondaryColor,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        // padding: const EdgeInsets.only(left: 15),
        child: Column(
          children: [
            // Recent film single view
            FutureBuilder(
              future: singleMovie,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500' +
                              snapshot.data.imgPoster,
                        ),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            secondaryColor.withOpacity(0.6), BlendMode.dstATop),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            secondaryColor,
                            secondaryColor.withOpacity(0.8),
                            secondaryColor.withOpacity(0.1),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: Text(
                                snapshot.data.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: Text(
                                snapshot.data.year.toString() +
                                    snapshot.data.minute.toString() +
                                    snapshot.data.rating.toString(),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    child: Text(
                                      '5.3',
                                      style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                ...List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: (index < (5 / 2).floor())
                                        ? Colors.yellow
                                        : Colors.white,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                }

                return CircularProgressIndicator();
              },
            ),

            // Popular
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "Popular Movies",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Container(
              height: 240,
              margin: EdgeInsets.only(top: 10, left: 8),
              child: FutureBuilder<List<Movie>>(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Movie> data = snapshot.data;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, index) {
                        // print(data[index].title);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailMoviePage(
                                      data[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 200,
                                width: 130,
                                margin: EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          data[index].imgPoster,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 140,
                              child: Text(
                                data[index].title,
                                style: TextStyle(
                                  color: white,
                                  fontSize: 17,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            )
                          ],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                  }

                  // By default, show a loading spinner.
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 80),
                              height: 200,
                              child: CircularProgressIndicator(),
                              width: 130,
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ],
                        );
                      });
                },
              ),
            ),
            // Container(
            //   height: 240,
            //   margin: EdgeInsets.only(top: 10, left: 8),
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: popularMovie.length,
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => DetailMoviePage(
            //         popularMovie[index],
            //       ),
            //     ),
            //   );
            // },
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Container(
            //       height: 200,
            //       width: 130,
            //       margin: EdgeInsets.only(right: 15),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         image: DecorationImage(
            //           fit: BoxFit.fill,
            //           image: AssetImage(
            //             popularMovie[index].imgPoster,
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       width: 140,
            //       child: Text(
            //         popularMovie[index].title,
            //         style: TextStyle(
            //           color: white,
            //           fontSize: 17,
            //         ),
            //         maxLines: 1,
            //         overflow: TextOverflow.clip,
            //       ),
            //     )
            //   ],
            // ),
            //       );
            //     },
            //   ),
            // ),
            // // Now Showing
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 8, top: 15),
                child: Text(
                  "Trending Movies",
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 10, left: 8),
              child: FutureBuilder<List<Movie>>(
                future: trendingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: 110,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          snapshot.data[index].imgPoster,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 110,
                                child: Text(
                                  snapshot.data[index].title,
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 17,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                  }

                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 80),
                              height: 200,
                              child: CircularProgressIndicator(),
                              width: 130,
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ],
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
