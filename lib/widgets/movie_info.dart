// import 'package:flutter/material.dart';

// class InfoScreen extends StatelessWidget {
  //  InfoScreen({this.trend,
  //    required this.index,
  //    this.nowplay,
  //    this.toprated,
  //    this.genres,
  //    this.searchmov,
  //    Key? key}) : super(key: key);
//   TrendingMovies? trend;
//   int index;
//   NowPlayingMovies? nowplay;
//   TopRatedMovies? toprated;
//    Map<int,String>? genres;
//    SearchMovies? searchmov;
//   String uri(){
//     var image;
//     if(trend!=null){
//        image="https://image.tmdb.org/t/p/w600_and_h900_bestv2${trend!.results![index].posterPath!}";
//     }
//     else if(nowplay!=null){
//       image="https://image.tmdb.org/t/p/w600_and_h900_bestv2${nowplay!.results![index].posterPath}";
//     }
//     else if(toprated!=null){
//       image="https://image.tmdb.org/t/p/w600_and_h900_bestv2${toprated!.results![index].posterPath!}";

//     }
//     else if(searchmov!=null){
//       image=(searchmov!.results[index].posterPath!='')?"https://image.tmdb.org/t/p/w600_and_h900_bestv2${searchmov!.results[index].posterPath!}":"https://vcunited.club/wp-content/uploads/2020/01/No-image-available-2.jpg";

//     }
//     return image;
//   }
//    String YesNo(){
//      var ok;
//      if(trend!=null){
//        ok=trend!.results![index].adult!? "Yes":"No";
//      }
//      else if(nowplay!=null){
//        ok=nowplay!.results![index].adult!?"Yes":"No";
//      }
//      else if(toprated!=null){
//        ok=toprated!.results![index].adult!?"Yes":"No";

//      }
//      else if(searchmov!=null){
//        ok=searchmov!.results[index].adult!?"Yes":"No";

//      }
//      return ok;
//    }
//    String description(){
//      var des;
//      if(trend!=null){
//        des=trend!.results![index].overview!;
//      }
//      else if(nowplay!=null){
//        des=nowplay!.results![index].overview!;
//      }
//      else if(toprated!=null){
//        des=toprated!.results![index].overview!;

//      }
//      else if(searchmov!=null){
//        des=searchmov!.results[index].overview!;

//      }
//      return des;
//    }
//    String title(){
//      var des;
//      if(trend!=null){
//        des=trend!.results![index].title!;
//      }
//      else if(nowplay!=null){
//        des=nowplay!.results![index].title;
//      }
//      else if(toprated!=null){
//        des=toprated!.results![index].title!;

//      }
//      else if(searchmov!=null){
//        des=searchmov!.results[index].title!;

//      }
//      return des;
//    }
//    double popularity(){
//      var pop;
//      if(trend!=null){
//        pop=trend!.results![index].popularity!;
//      }
//      else if(nowplay!=null){
//        pop=nowplay!.results![index].popularity!;
//      }
//      else if(toprated!=null){
//        pop=toprated!.results![index].popularity!;

//      }
//      else if(searchmov!=null){
//        pop=searchmov!.results[index].popularity!;

//      }
//      return pop;
//    }
//    double rating(){
//      var pop;
//      if(trend!=null){
//        pop=trend!.results![index].voteAverage!;
//      }
//      else if(nowplay!=null){
//        pop=nowplay!.results![index].voteAverage!;
//      }
//      else if(toprated!=null){
//        pop=toprated!.results![index].voteAverage!;

//      }
//      else if(searchmov!=null){
//        pop=searchmov!.results[index].voteAverage!;

//      }
//      return pop;
//    }
//    int rateby(){
//      var pop;
//      if(trend!=null){
//        pop=trend!.results![index].voteCount!;
//      }
//      else if(nowplay!=null){
//        pop=nowplay!.results![index].voteCount!;
//      }
//      else if(toprated!=null){
//        pop=toprated!.results![index].voteCount!;

//      }
//      else if(searchmov!=null){
//        pop=searchmov!.results[index].voteCount!;

//      }
//      return pop;
//    }
//    String reldate(){
//      var pop;
//      if(trend!=null){
//        pop=trend!.results![index].releaseDate!.toIso8601String();
//      }
//      else if(nowplay!=null){
//        pop=nowplay!.results![index].releaseDate!.toIso8601String();
//      }
//      else if(toprated!=null){
//        pop=toprated!.results![index].releaseDate!.toIso8601String();

//      }
//      else if(searchmov!=null){
//        pop=searchmov!.results[index].releaseDate!.toString();

//      }
//      if(pop.length<10){
//        return 'not  known';
//      }
//      return pop.substring(0,10);
//    }
//    String lang(){
//      var pop;
//      if(trend!=null){
//        pop=trend!.results![index].originalLanguage!.name.toString();
//      }
//      else if(nowplay!=null){
//        pop=nowplay!.results![index].originalLanguage!.name.toString();
//      }
//      else if(toprated!=null){
//        pop=toprated!.results![index].originalLanguage!.name.toString();

//      }
//      else if(searchmov!=null){

//        pop=searchmov!.results[index].originalLanguage?.name.toString()??' not known';


//      }
//      return pop;
//    }
//    List<String> gen(){
//     List<String> nok=[];

//     if(trend!=null){
//       for(var i in trend!.results![index].genreIds!) {
//         if({genres![i]}!=null)
//      { nok.add(genres![i]!);}
//       }
//     }
//     else if(nowplay!=null){
//       for(var i in nowplay!.results![index].genreIds!)
//        {  if({genres![i]}!=null)
//        { nok.add(genres![i]!);}
//        }
//     }
//     else if(toprated!=null){
//       for(var i in toprated!.results![index].genreIds!) {
//         if({genres![i]}!=null)
//         { nok.add(genres![i]!);}
//       }
//     }
//     else if(searchmov!=null){
//       for(var i in searchmov!.results[index].genreIds!) {
//         if({genres![i]}!=null)
//         { nok.add(genres![i]!);}
//       }
//     }
//     if(nok.isEmpty){
//       nok.add('Not Know');
//     }
//     return nok;
//    }






//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       appBar: AppBar(
//         title: Text(title(),
//           style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[50]
//           ),
//           maxLines: 2,
//         ),
//         centerTitle: true,
//       ),
//       body:Center(
//         child: ListView(

//           children: [
//             const SizedBox(height: 10,),

//             Image(image: NetworkImage(uri()),
//             height:300,
//             ),
//           const SizedBox(height: 10,),
//           Container(
//             height: 0.5,
//             color: Colors.white,
//           ),
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [

//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Text(' Release on',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey[50]
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Text('${reldate() }  ',
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.grey[50]
//                       ),
//                       textAlign: TextAlign.left,
//                     ),
//                   ],
//                 ),
//                 Container(
//                   height: 0.5,
//                   color: Colors.white,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20.0),
//                       child: Text(' Genre',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey[50]
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 250,
//                       child: Text('${gen()}',
//                         overflow: TextOverflow.clip,
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey[50]
//                         ),
//                         maxLines: null,
//                       ),
//                     ),

//                   ],
//                 ),

//                 Container(
//                   height: 0.5,
//                   color: Colors.white,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Text(' Rating',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey[50]
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     Text('${rating()}       ',
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.grey[50]
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 Container(
//                   height: 0.5,
//                   color: Colors.white,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Text(' Rated By',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey[50]
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     Text('${rateby()} people  ',
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.grey[50]
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 Container(
//                   height: 0.5,
//                   color: Colors.white,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Text(' Popularity',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey[50]
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     Text('${popularity()}   ',
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.grey[50]
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 Container(
//                   height: 0.5,
//                   color: Colors.white,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(' Adult Film',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey[50]
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       Text('${YesNo()} ',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey[50]
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 0.5,
//                   color: Colors.white,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Text(' Original language',
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey[50]
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     Text('${lang()}  ',
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.grey[50]
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 Container(
//                   height: 0.5,
//                   color: Colors.white,
//                 ),

//               ],
//             ),
//             SizedBox(height: 5,),
//             Text('DESCRIPTION: ',
//               style: TextStyle(
//                   fontSize: 20,

//                   color: Colors.grey[50]
//               ),
//               textAlign: TextAlign.center,
//             ),
//             Container(padding: EdgeInsets.symmetric(horizontal: 5),
//               child: Text(description(),
//                 style: TextStyle(
//                     fontSize: 20,

//                     color: Colors.grey[50]
//                 ),

//               ),
//             ),




//           ],
//         ),

//     ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  final Map<String,dynamic> movie;
  InfoScreen({required this.movie,
     Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 207, 8, 151),
        centerTitle: true,
        title: (widget.movie['title']==null?Text("Name NA"):Text("${widget.movie['title']}")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.3,maxWidth: MediaQuery.of(context).size.height*0.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Flexible(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage((widget.movie['poster_path'] !=
                                              null)
                                          ? "https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.movie['poster_path']}"
                                          : "https://vcunited.club/wp-content/uploads/2020/01/No-image-available-2.jpg"),
                                    ),
                                  ),],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (widget.movie['title']==null?"NA":"${widget.movie['title']}"),
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today,color: Colors.blue),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('Released On: ',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 20)),
                ),
                Text((widget.movie['release_date']==null?"NA":"${widget.movie['release_date']}"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star,color: Colors.blue),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('Rating: ',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 20)),
                ),
                Text((widget.movie['vote_average']==null?"NA":"${widget.movie['vote_average']}"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.people,color: Colors.blue),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('Rated by: ',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 20)),
                ),
                Text((widget.movie['vote_count']==null?"NA":"${widget.movie['vote_count']}"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.trending_up,color: Colors.blue),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('Popularity: ',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 20)),
                ),
                Text((widget.movie['popularity']==null?"NA":"${widget.movie['popularity']}"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.man,color: Colors.blue),
                SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('Adult Film: ',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 20)),
                ),
                Text((widget.movie['adult']==null?"NA":(widget.movie['adult']==true?"Yes":"No")),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Description',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.pinkAccent),
            ),
            SizedBox(height: 8),
            Text(
              (widget.movie['overview']==null?"NA":"${widget.movie['overview']}"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final double width;
  final double height;

  PlaceholderWidget(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
    );
  }
}