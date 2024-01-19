import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage(
      {Key? key,
      required this.overview,
      required this.releaseDate,
      required this.title,
      required this.boxOffice,
      required this.directedBy,
      required this.imgUrl,
      required this.trailerUrl})
      : super(key: key);
  String title;
  String imgUrl;
  String overview;
  String releaseDate;
  String boxOffice;
  String directedBy;
  String trailerUrl;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1D),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: const Color(0xFF1A1A1D),
              shadowColor: const Color(0xFF1A1A1D),
              onStretchTrigger: () async {},
              stretchTriggerOffset: size.height * 0.2,
              expandedHeight: size.height * 0.5,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF1A1A1D),
                        Colors.transparent,
                        Colors.transparent,
                        Color(0xFF1A1A1D)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0, 0.4, 1],
                    ),
                  ),
                  child: Image.network(imgUrl, fit: BoxFit.cover),
                ),
              ),
            ),
            SliverFillViewport(
                delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => Container(
                color: const Color(0xFF1A1A1D),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      title,
                      style: TextStyle(
                          fontSize: size.height * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.star,
                                color: Colors.yellow, size: size.height * 0.02),
                            Icon(Icons.star,
                                color: Colors.yellow, size: size.height * 0.02),
                            Icon(Icons.star,
                                color: Colors.yellow, size: size.height * 0.02),
                            Icon(Icons.star,
                                color: Colors.yellow, size: size.height * 0.02),
                            Icon(Icons.star,
                                color: Colors.yellow, size: size.height * 0.02),
                          ],
                        ),
                        Text(
                          releaseDate,
                          style: TextStyle(
                              fontSize: size.width * 0.03,
                              color: const Color(0xFF848484),
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "From $boxOffice users",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF848484),
                              fontSize: 10),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.height * 0.05),
                      child: Text(
                        "Directed by $directedBy",
                        style: const TextStyle(
                            color: Color(0xFF848484),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: size.height * 0.05,
                          left: size.height * 0.05,
                        ),
                        child: Text(
                          overview,
                          style: const TextStyle(
                              color: Color(0xFF848484),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: size.height * 0.1,
                          left: size.height * 0.1,
                          top: size.height * 0.06),
                      child: InkWell(
                        onTap: () {
                          _launchUrl(trailerUrl ?? "https://www.google.com/");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.lightBlueAccent,
                                  offset: Offset(0.1, 1.0), //(x,y)
                                  blurRadius: 7.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(50),
                              gradient: const LinearGradient(colors: [
                                Color(0xFF1C9DBC),
                                Color(0xFF4F6DA6),
                                Color(0xFF7A4493)
                              ])),
                          child: const Text("Watch Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

_launchUrl(url) async {
  await launch(url);
}
