import 'package:flutter/material.dart';
import 'package:imdb/Data/detailsFile.dart';
import 'package:imdb/Views/Pages/detailsPage.dart';
import 'package:imdb/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: secondaryColor,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/cast/esther4.jpg'),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            secondaryColor,
                            secondaryColor.withOpacity(.3)
                          ])),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Esther Acebo",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "02 Movies",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Icon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.white70,
                                  size: 17,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.white70,
                                  size: 17,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.white70,
                                  size: 17,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Esther Acebo is a Spanish film and television actress.Esther Acebo is a Spanish film and television actress.Esther Acebo is a Spanish film and television actress.",
                          style: TextStyle(color: Colors.grey, height: 1.4),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Birthday",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "1983-01-19 (38 years old) ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Nationality",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Madrid, Spain",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Known For",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        // Container(
                        //   height: 240,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: popularMovie.length,
                        //     itemBuilder: (context, index) {
                        //       return GestureDetector(
                        //         onTap: () {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (context) => DetailMoviePage(
                        //                 popularMovie[index],
                        //               ),
                        //             ),
                        //           );
                        //         },
                        //         child: Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceEvenly,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Container(
                        //               height: 160,
                        //               width: 110,
                        //               margin: EdgeInsets.only(right: 10),
                        //               decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 image: DecorationImage(
                        //                   fit: BoxFit.fill,
                        //                   image: AssetImage(
                        //                     popularMovie[index].imgPoster,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //             Container(
                        //               width: 125,
                        //               child: Text(
                        //                 popularMovie[index].title,
                        //                 style: TextStyle(
                        //                   color: white,
                        //                   fontSize: 15,
                        //                 ),
                        //                 maxLines: 1,
                        //                 overflow: TextOverflow.clip,
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Container(
                        //   height: 200,
                        //   child: ListView(
                        //     scrollDirection: Axis.horizontal,
                        //     children: [
                        //       makeVideo(image: 'assets/cast/esther2.jpg'),
                        //       makeVideo(image: 'assets/cast/esther3.jpg'),
                        //       makeVideo(image: 'assets/cast/esther4.jpg'),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 120,
                        // )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          // Positioned.fill(
          //   bottom: 50,
          //   child: Container(
          //     child: Align(
          //       alignment: Alignment.bottomCenter,
          //       // child: FadeAnimation(
          //       //   2,
          //       //   Container(
          //       //     margin: EdgeInsets.symmetric(horizontal: 30),
          //       //     height: 50,
          //       //     decoration: BoxDecoration(
          //       //         borderRadius: BorderRadius.circular(50),
          //       //         color: Colors.yellow[700]),
          //       //     child: Align(
          //       //         child: Text(
          //       //       "Follow",
          //       //       style: TextStyle(color: Colors.white),
          //       //     )),
          //       //   ),
          //       // ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget makeVideo({image}) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            secondaryColor.withOpacity(.9),
            secondaryColor.withOpacity(.3)
          ])),
          child: Align(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 70,
            ),
          ),
        ),
      ),
    );
  }
}
