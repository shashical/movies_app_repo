import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/utils/textstyle.dart';
import 'package:movies_app/widgets/nowplaying.dart';
import 'package:movies_app/widgets/toprated.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movies_app/widgets/trending.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trending_movies = [];
  List toprated_movies = [];
  List nowPlaying_movies=[];
  final String apikey = "8ce2e89766414072fbd3a681c0d3bca5";
  final String token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4Y2UyZTg5NzY2NDE0MDcyZmJkM2E2ODFjMGQzYmNhNSIsInN1YiI6IjYzYTdmMWVjMTVhNGExMDA3YTkwMWM5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nV9Yid6Q-Wxpbv9V4bXDn4z_8v080R_RFj2HnQZlbFM";
  
  void initState(){
    load_data();
    super.initState();
  }

  load_data()async{
    TMDB  tmdbWithCustomLogs = TMDB(ApiKeys(apikey,token),
    logConfig: ConfigLogger(
      showErrorLogs: true,
      showLogs: true,
      ));
      Map trendingres= await tmdbWithCustomLogs.v3.trending.getTrending();
      Map topratedres= await tmdbWithCustomLogs.v3.movies.getTopRated();
      Map nowplayingres= await tmdbWithCustomLogs.v3.movies.getNowPlaying();
      setState(() {
        trending_movies=trendingres['results'];
        toprated_movies=topratedres['results'];
        nowPlaying_movies=nowplayingres['results'];
      });
      print(trending_movies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 207, 8, 151),
          automaticallyImplyLeading: false,
          title: Center(child: new_text(text:'Movies'))),
        body: ListView(
          children:[
            TrendingMovies(trending:trending_movies),
            TopRatedMovies(toprated: toprated_movies),
            NowPlayingMovies(nowplaying: nowPlaying_movies),
          ]
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ));
            print("Signed out");
          });
        },
        child: Icon(
          Icons.logout,
          color: Color.fromARGB(255, 249, 246, 246),
        ),
      ),
    );
  }
}
