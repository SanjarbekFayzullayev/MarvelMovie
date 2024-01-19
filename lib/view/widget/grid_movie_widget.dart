import 'package:flutter/material.dart';

class GridMovieWidget extends StatelessWidget {
  const GridMovieWidget({Key? key, required this.title, required this.imgUrl})
      : super(key: key);
  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(size.height * 0.02)),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF1A1A1D),
            Colors.transparent,
            Colors.transparent,
            Color(0xFF1A1A1D)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0, 0.8, 1],
        ),
      ),
      margin: EdgeInsets.only(
          top: size.height * 0.01,
          left: size.height * 0.02,
          right: size.height * 0.02),
      height: size.height * 0.12,
      width: size.height * 0.12,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE28138),
            spreadRadius: 2,
            blurRadius: size.height * 0.008,
            offset: Offset(
              size.height * 0.001,
              size.height * 0.001,
            ), // changes position of shadow
          ),
        ],
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(size.height * 0.02),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                title,
                style:  TextStyle(
                  fontSize: size.height*0.02,
                  backgroundColor: Colors.black,
                  color: const Color(0xFFE28138),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            ]),
      ),
    );
  }
}
