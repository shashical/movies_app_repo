import 'package:flutter/material.dart';
import 'package:movies_app/utils/textstyle.dart';
import 'package:movies_app/widgets/movie_info.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new_text(
            text: 'Trending Movies',
            size: 26,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InfoScreen(
                                                movie: trending[index],
                                                  )));
                },
                child: Container(
                  width: 140,
                  child: Column(children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500' +
                            trending[index]['poster_path'],
                      ))),
                    ),
                    Container(
                      child: new_text(
                          color: Colors.white,
                          text: trending[index]['title'] != null
                              ? trending[index]['title']
                              : 'N/A'),
                    )
                  ]),
                ),
              ),
              itemCount: trending.length,
            ),
          )
        ],
      ),
    );
  }
}
