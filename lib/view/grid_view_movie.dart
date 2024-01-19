import 'package:flutter/material.dart';
import 'package:muslimmovie/model/movie.dart';
import 'package:muslimmovie/view/widget/grid_movie_widget.dart';

import 'detals_page.dart';

class GridViewMovie extends StatefulWidget {
  GridViewMovie({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;

  @override
  _GridViewMovieState createState() => _GridViewMovieState();
}

class _GridViewMovieState extends State<GridViewMovie> {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(size.height * 0.3),
              elevation: 6,
              shadowColor: const Color(0xFFB06732),
              child: TextField(
                controller: _textEditingController,
                onChanged: filterMovies,
                cursorColor: Colors.grey,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF0F0F11),
                  focusColor: Colors.grey,
                  isDense: true,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0),
                  hintText: "Search Movies...",
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6C6C6C),
                  ),
                  suffixIcon: IconButton(
                    splashRadius: 0.1,
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: size.height * 0.04,
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(size.height * 0.3),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Color(0xFFB06732),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(size.height * 0.3),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Color(0xFFB06732),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: filteredMovies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 6,
                crossAxisCount: 2,
                mainAxisExtent: size.height * 0.4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  overlayColor:
                  const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          overview: filteredMovies[index].overview ?? "No data",
                          releaseDate:
                          filteredMovies[index].releaseDate ?? "No data",
                          title: filteredMovies[index].title ?? "No data",
                          boxOffice:
                          filteredMovies[index].boxOffice ?? "No data",
                          directedBy:
                          filteredMovies[index].directedBy ?? "No data",
                          imgUrl: filteredMovies[index].coverUrl ?? "No data",
                          trailerUrl:
                          filteredMovies[index].trailerUrl ?? "No data",
                        ),
                      ),
                    );
                  },
                  child: GridMovieWidget(
                      imgUrl: filteredMovies[index].coverUrl ?? "No data",
                      title: filteredMovies[index].title ?? "No data"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
