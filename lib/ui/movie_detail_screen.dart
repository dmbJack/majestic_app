
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majestic_app/model/movie.dart';
import 'package:majestic_app/resources/movie_method.dart';
import 'package:majestic_app/utils/constant.dart';


class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 550,
                ),
                Positioned(
                  top: 0,
                  child: Hero(
                    tag: movie.posterLink,
                    child: Image.network(
                      movie.posterLink,
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                DelayedDisplay(
                  delay: const Duration(milliseconds: 300),
                  child: Positioned(
                    top: 450,
                    child: Container(
                      height: 70,
                      width: 70,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 50,
                            color: Colors.white,
                          )),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 5,
                                blurRadius: 10,
                                color: Colors.black38)
                          ],
                          color: Colors.red.shade900,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
                Positioned(
                  top: 510,
                  left: 30,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.red.withOpacity(0.5), width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      movie.getDuration(),
                      style: font(size: 16, colors: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            DelayedDisplay(
              delay: const Duration(milliseconds: 300),
              child: Container(
                // alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: font(size: 22, colors: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text.rich(TextSpan(
                          text: 'Genre :',
                          style: font(
                              size: 16,
                              colors: Colors.white,
                              weight: FontWeight.w600),
                          children: [
                            TextSpan(
                                text: ' ${movie.genre}',
                                style: font(
                                    size: 16,
                                    colors: Colors.white,
                                    weight: FontWeight.w400))
                          ])),
                    ),
                    Container(
                      margin: const EdgeInsets.all(2),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        MovieMethod().getMovieStatus(movie: movie),
                        style: font(size: 16, colors: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text.rich(TextSpan(
                          text: 'Director :',
                          style: font(
                              size: 16,
                              colors: Colors.white,
                              weight: FontWeight.w600),
                          children: [
                            TextSpan(
                                text: ' ${movie.director.getName()}',
                                style: font(
                                    size: 16,
                                    colors: Colors.white,
                                    weight: FontWeight.w400))
                          ])),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 5,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.red.shade300,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Synopsys',
                            style: font(
                                size: 18,
                                colors: Colors.white,
                                weight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      movie.resume,
                      style: font(
                          size: 14,
                          colors: Colors.white,
                          weight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 5,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.red.shade300,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Horaire',
                            style: font(
                                size: 18,
                                colors: Colors.white,
                                weight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    ...movie.date.map((e) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 5),
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                ' ${DateFormat('d EEE M', 'fr').format(e)} à ${DateFormat().add_Hm().format(e)}',
                                style: font(size: 16, colors: Colors.white),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
