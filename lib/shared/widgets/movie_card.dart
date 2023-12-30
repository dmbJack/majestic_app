import 'package:flutter/material.dart';
import 'package:majestic_app/utils/constant.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.red,
          width: 220,
          height: 340,
          margin: const EdgeInsets.symmetric(horizontal: 3),
        ),
        Positioned(
          top: 310,
          left: 155,
          child: Container(
            color: Colors.black,
            width: 70,
            height: 35,
            child: Center(child: Text('22:00', style: font(size: 20, colors: Colors.white),)),
          ),
        )
      ],
    );
  }
}
