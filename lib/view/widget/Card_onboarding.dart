import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muslimmovie/model/card_class.dart';

class CardOnboarding extends StatelessWidget {
  CardOnboarding({Key? key, required this.data}) : super(key: key);
  final CardClass data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(data.image),
        Text(
          data.title,
          style: const TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
