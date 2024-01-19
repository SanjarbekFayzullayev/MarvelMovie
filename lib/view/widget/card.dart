import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Card1 extends StatelessWidget {
  Card1(
      {Key? key,
      this.color1,
      this.color2,
      this.color3,
      required this.radiusLeft,
      required this.radiusRight,
      required this.url,
      this.sizee,
      this.top,
      required this.alignment,
      this.icons})
      : super(key: key);
  final dynamic color1;
  final dynamic color2;
  final dynamic color3;
  final Radius radiusLeft;
  final Radius radiusRight;
  final String url;
  dynamic sizee;
  dynamic top;
  final Alignment alignment;
  final dynamic icons;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Material(
          elevation: 12,
          shadowColor: color2,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(size.height * 0.06),
            topLeft: radiusLeft,
            topRight: radiusRight,
            bottomLeft: const Radius.circular(20),
          ),
          child: Container(
            alignment: alignment,
            height: size.height * 0.2,
            width: size.width * 0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color1, color2, color3],
                  transform: const GradientRotation(5)),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(size.height * 0.06),
                topLeft: radiusLeft,
                topRight: radiusRight,
                bottomLeft: const Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                  child: const Text(
                    "Marvel\nStudios",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                Icon(
                  icons,
                  size: size.height * 0.04,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: top,
            right: sizee,
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Image.asset(url, width: size.width * 0.3),
            ))
      ],
    );
  }
}
