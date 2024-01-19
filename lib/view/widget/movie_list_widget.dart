import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key, required this.imgUrl, required this.title, required this.releaseDate}) : super(key: key);
  final String imgUrl;
  final String title;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.16,
        decoration: BoxDecoration(
          color: const Color(0xFF0F0F11),
          borderRadius: BorderRadius.all(
            Radius.circular(size.height * 0.02),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            foregroundDecoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(size.height * 0.02)),
              gradient: const LinearGradient(
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
            margin: EdgeInsets.all(size.height * 0.02),
            height: size.height * 0.12,
            width: size.height * 0.12,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey,
                  spreadRadius: 2,
                  blurRadius: size.height * 0.008,
                  offset: Offset(
                    size.height * 0.001,
                    size.height * 0.001,
                  ), // changes position of shadow
                ),
              ],
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(size.height * 0.02),
            ),
          ),
          Expanded(
            child: Text(
              overflow: TextOverflow.fade,
              title,
              style: TextStyle(
                  fontSize: size.height * 0.027,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.height * 0.016),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Icon(
                  Icons.play_arrow,
                  color: Colors.blueGrey,
                  size: size.height * 0.04,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
