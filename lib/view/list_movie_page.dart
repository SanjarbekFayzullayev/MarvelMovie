import 'package:flutter/material.dart';
import 'package:muslimmovie/model/movie.dart';
import 'package:muslimmovie/view/detals_page.dart';
import 'package:muslimmovie/view/widget/movie_list_widget.dart';

class ListMoviePage extends StatefulWidget {
  const ListMoviePage({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;

  @override
  State<ListMoviePage> createState() => _ListMoviePageState();
}

class _ListMoviePageState extends State<ListMoviePage> {
  TextEditingController _textEditingController = TextEditingController();
  List<Movie> filteredMovies = [];

  @override
  void initState() {
    filteredMovies = widget.movies;
    super.initState();
  }

  void filterMovies(String query) {
    setState(() {
      filteredMovies = widget.movies
          .where((movie) =>
              movie.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1D),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(size.height * 0.3),
                child: TextField(
                  onChanged: filterMovies,
                  controller: _textEditingController,
                  cursorColor: Colors.grey,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF0F0F11),
                    focusColor: Colors.grey,

                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15.0),
                    /* -- Text and Icon -- */
                    hintText: "Search Movies...",
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6C6C6C),
                    ),
                    // TextStyle
                    suffixIcon: IconButton(
                      splashRadius: 0.1,
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: size.height * 0.04,
                        color: Colors.grey,
                      ),
                    ),
                    // Icon
                    /* -- Border Styling -- */
                    // OutlineInputBorder
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.height * 0.3),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: Colors.blueGrey,
                      ), // BorderSide
                    ),
                    // OutlineInputBorder
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(size.height * 0.3),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: Colors.blueGrey,
                      ), // BorderSide
                    ), // OutlineInputBorder
                  ), // InputDecoration
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredMovies.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              overview:
                                  filteredMovies[index].overview ?? "No data",
                              releaseDate: filteredMovies[index].releaseDate ??
                                  "No data",
                              title: filteredMovies[index].title ?? "No data",
                              boxOffice:
                                  filteredMovies[index].boxOffice ?? "No data",
                              directedBy:
                                  filteredMovies[index].directedBy ?? "No data",
                              imgUrl:
                                  filteredMovies[index].coverUrl ?? "No data",
                              trailerUrl:
                                  filteredMovies[index].trailerUrl ?? "No data",
                            ),
                          ),
                        );
                      },
                      child: MovieListWidget(
                        imgUrl: filteredMovies[index].coverUrl ?? "No data",
                        title: filteredMovies[index].title ?? "No data",
                        releaseDate:
                            filteredMovies[index].releaseDate ?? "No data",
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
