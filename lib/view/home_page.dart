import 'dart:io';

import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muslimmovie/core/api_responcse.dart';
import 'package:muslimmovie/view/detals_page.dart';
import 'package:muslimmovie/view/grid_view_movie.dart';
import 'package:muslimmovie/view/list_movie_page.dart';
import 'package:muslimmovie/view/widget/card.dart';
import 'package:muslimmovie/view/widget/list_view.dart';
import 'package:provider/provider.dart';

import '../model/movie.dart';
import '../viewmodel/main_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = TextEditingController();
  List<Movie> filteredMovies = [];

  @override
  void initState() {
    super.initState();
    Provider.of<MainViewModel>(context, listen: false).fetPopular();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    size.height * 2;
    return WillPopScope(
        onWillPop: () async {
          final value = await showDialog<bool>(
            context: context,
            builder: (context) => AlderDilaogNew(),
          );
          if (value != null) {
            return Future.value(value);
          } else {
            return Future.value(false);
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF1A1A1D),
          body: Consumer<MainViewModel>(
            builder: (context, data, child) {
              if (data.response.status == Status.LOADING) {
                return Center(
                  child: Container(
                    color: Colors.black,
                    height: double.infinity,
                    width: double.infinity,
                    child: Lottie.asset("assets/anim/loading.json"),
                  ),
                );
              }
              if (data.response.status == Status.COMPLETED) {
                return SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius:
                              BorderRadius.circular(size.height * 0.3),
                          elevation: 6,
                          shadowColor:Colors.white,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: const [
                                  Color(0xFFE28138),
                                  Color(0xFFF44F32),
                                  Color(0xFFF44F32),
                                  Color(0xFF0A77C4),
                                  Color(0xFF0A77C4),
                                  Color(0xFF14BBE9),
                                ],
                                transform: GradientRotation(size.height * 0.3),
                              ),
                              borderRadius:
                                  BorderRadius.circular(size.height * 0.4),
                            ),
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.all(size.height * 0.01),
                              child: Text(
                                "Marvel Studios",
                                style: TextStyle(
                                    fontSize: size.height * 0.04,
                                    color: Colors.white38,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.02),
                        child: const Text(
                          "Modes",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            onTap: () {
                              Navigator.push(
                                context,
                                ModalBottomSheetRoute(
                                  builder: (ctx) {
                                    return ListMoviePage(
                                      movies: data.movies,
                                    );
                                  },
                                  isScrollControlled: false,
                                ),
                              );
                            },
                            child: Card1(
                              color1: const Color(0xFF0043A7),
                              color2: const Color(0xFF0A77C4),
                              color3: const Color(0xFF14BBE9),
                              radiusLeft: const Radius.elliptical(180, 60),
                              radiusRight: const Radius.circular(20),
                              url: "assets/img/spiderman.png",
                              sizee: size.height * 0.08,
                              top: size.height * 0.02,
                              alignment: Alignment.topRight,
                              icons: Icons.format_list_bulleted,
                            ),
                          ),
                          InkWell(
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  ModalBottomSheetRoute(
                                    builder: (ctx) {
                                      return GridViewMovie(
                                        movies: data.movies,
                                      );
                                    },
                                    isScrollControlled: false,
                                  ));
                            },
                            child: Card1(
                              color1: const Color(0xFFE28138),
                              color2: const Color(0xFFF44F32),
                              color3: const Color(0xFFFF2D2D),
                              radiusLeft: const Radius.circular(20),
                              radiusRight: const Radius.elliptical(180, 60),
                              url: "assets/img/one.png",
                              sizee: -size.height * 0.02,
                              top: -size.height * 0.04,
                              alignment: Alignment.topLeft,
                              icons: Icons.grid_view_outlined,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.02),
                        child: const Text(
                          "Most searched.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.movies.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                      overview: data.movies[index].overview ??
                                          "No data",
                                      releaseDate:
                                          data.movies[index].releaseDate ??
                                              "No data",
                                      title:
                                          data.movies[index].title ?? "No data",
                                      boxOffice: data.movies[index].boxOffice ??
                                          "No data",
                                      directedBy:
                                          data.movies[index].directedBy ??
                                              "No data",
                                      imgUrl: data.movies[index].coverUrl ??
                                          "No data",
                                      trailerUrl:
                                          data.movies[index].trailerUrl ??
                                              "No data"),
                                ),
                              ),
                              child: ListWidget(
                                title: data.movies[index].title!,
                                imgUrl: data.movies[index].coverUrl!,
                                date: data.movies[index].releaseDate!,
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: PageController(initialPage: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.movies.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                      overview: data.movies[index].overview ??
                                          "No data",
                                      releaseDate:
                                          data.movies[index].releaseDate ??
                                              "No data",
                                      title:
                                          data.movies[index].title ?? "No data",
                                      boxOffice: data.movies[index].boxOffice ??
                                          "No data",
                                      directedBy:
                                          data.movies[index].directedBy ??
                                              "No data",
                                      imgUrl: data.movies[index].coverUrl ??
                                          "No data",
                                      trailerUrl:
                                          data.movies[index].trailerUrl ??
                                              "No data"),
                                ),
                              ),
                              child: ListWidget(
                                title: data.movies[index].title ?? "No data",
                                imgUrl:
                                    data.movies[index].coverUrl ?? "No data",
                                date:
                                    data.movies[index].releaseDate ?? "No data",
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (data.response.status == Status.ERROR) {
                return Center(
                  child: Container(
                    child: Lottie.asset("assets/anim/eror.json"),
                  ),
                );
              }
              if (data.response.status == Status.INTAL) {
                return Center(
                  child: Container(
                    child: Lottie.asset("assets/anim/loading.json"),
                  ),
                );
              }
              return Center(
                child: Container(
                  child: Lottie.asset("assets/anim/eror.json"),
                ),
              );
            },
          ),
        ));
  }

  Widget AlderDilaogNew() {
    return AlertDialog(
      backgroundColor: const Color(0xFF1A1A1D),
      title: const Card(
        color: Color(0xFF1A1A1D),
        elevation: 20,
        shadowColor: Colors.grey,
      ),
      content: const Text("Do you want to exit the program?",
          style: TextStyle(
              fontSize: 24, color: Colors.grey, fontWeight: FontWeight.w600)),
      actions: [
        ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey),
          ),
          onPressed: () {
            Navigator.of(context).pop(exit(1));
          },
          child: const Text("Yes"),
        ),
        ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.grey),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("No")),
      ],
    );
  }
}
