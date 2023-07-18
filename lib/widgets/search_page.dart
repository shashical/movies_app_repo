import 'package:flutter/material.dart';
import 'package:movies_app/home.dart';
import 'package:movies_app/widgets/movie_info.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Map? searchedMovies;
  bool isLoaded = false;
  final TextEditingController searchController = TextEditingController();

  getSearch(String query) async {
    try {
      searchedMovies = await tmdbWithCustomLogs!.v3.search.queryMovies(query);
      if (searchedMovies != null) {
        debugPrint('successfully searched movies');
        print(searchedMovies!['results']);
        setState(() {
          isLoaded = true;
        });
      }
    } catch (e) {
      SnackBar Mysnackbar = SnackBar(content: Text('$e'));
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(Mysnackbar);
      setState(() {
        isLoaded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 207, 8, 151),
          centerTitle: true,
          title: Text("Search"),
        ),
        backgroundColor: Colors.black,//Colors.grey[900],
        body: Center(
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.95),
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Row(crossAxisAlignment: CrossAxisAlignment.end,children: [
                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: TextField(
                                        style: const TextStyle(fontSize: 19),
                                        maxLines: null,
                                        controller: searchController,
                            textInputAction: TextInputAction.go,
                            onSubmitted: (value) {
                              if (value.isEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: const Text(
                                              'Please Enter something to search'),
                                          actions: [
                                            Builder(builder: (context) {
                                              return ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop();
                                                  },
                                                  child: const Text('Ok'));
                                            })
                                          ],
                                        ));
                              } else {
                                getSearch(value.toString());
                              }
                            },
                                        decoration: const InputDecoration(
                                          hintText: 'Type here',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                            onPressed: () {
                              final String query = searchController.text;

                              if (query.isEmpty) {
                                Navigator.pop(context);
                              } else {
                                setState(() {
                                  searchController.clear();
                                });
                              }
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.grey,
                              size: 28,
                            )),
                ]),
              ),
              Visibility(
                visible: isLoaded,
                replacement: Center(
                  child: Container(),
                ),
                child: Expanded(
                  child: GridView.builder(
                      itemCount: searchedMovies?['results'].length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: .5),
                      itemBuilder: ((context, index) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InfoScreen(
                                                movie: searchedMovies!['results'][index],
                                                  )));
                                  },
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage((searchedMovies![
                                                    'results'][index]
                                                ['poster_path'] !=
                                            null)
                                        ? "https://image.tmdb.org/t/p/w600_and_h900_bestv2${searchedMovies!['results'][index]['poster_path']}"
                                        : "https://vcunited.club/wp-content/uploads/2020/01/No-image-available-2.jpg"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => InfoScreen(
                                                movie: searchedMovies!['results'][index],
                                                  )));
                                    },
                                    child: Text(
                                      searchedMovies!['results'][index]
                                              ['title'] ??
                                          "",
                                      style: const TextStyle(
                                        color: Colors.pinkAccent,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ],
                          ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
