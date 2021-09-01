import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imdb/Data/detailsFile.dart';
import 'package:imdb/Views/detailsPage.dart';
import 'package:imdb/config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Container(
              height: 450,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/arrival-poster.jpg',
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
                          'Arrival',
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
                          '2021' + 'Action' + '180 Minute',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularMovie.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailMoviePage(
                            popularMovie[index],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: 130,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                popularMovie[index].imgPoster,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 140,
                          child: Text(
                            popularMovie[index].title,
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
              ),
            ),
            // Now Showing
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
              height: 170,
              margin: EdgeInsets.only(top: 10, left: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nowShowing.length,
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
                              image: AssetImage(
                                nowShowing[index].imgPoster,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 110,
                          child: Text(
                            nowShowing[index].title,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
