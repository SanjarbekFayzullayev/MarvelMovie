import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ListWidget extends StatelessWidget {
  const ListWidget(
      {Key? key, required this.title, required this.imgUrl, required this.date})
      : super(key: key);
  final String title;
  final String imgUrl;
  final String date;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    size.height * 2;
    return Padding(
      padding: EdgeInsets.only(left: size.height * 0.01),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              color: Colors.black38,
            ),
            height: size.height * 0.2,
            width: size.width * 0.3,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: size.width * 0.03,
                  color: const Color(0xFFE8E8E8)),
            ),
          ),

        ],
      ),
    );
  }
}
