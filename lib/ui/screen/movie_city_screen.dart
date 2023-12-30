import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:majestic_app/model/movie.dart';
import 'package:majestic_app/model/person.dart';
import 'package:majestic_app/resources/movie_method.dart';
import 'package:majestic_app/ui/movie_detail_screen.dart';
import 'package:majestic_app/utils/constant.dart';

class MovieCityScreen extends StatefulWidget {
  const MovieCityScreen({Key? key}) : super(key: key);

  @override
  State<MovieCityScreen> createState() => _MovieCityScreenState();
}

class _MovieCityScreenState extends State<MovieCityScreen> {
  final PageController _textMoviePageController = PageController();
  final PageController _moviePageController =
      PageController(viewportFraction: 0.8);
  double currentPage = 0;
  final PageController _dateMoviePageController = PageController();
  void moviePageListener() {
    setState(() {
      currentPage = _moviePageController.page!;
    });
  }

  void textPageListener() {
    setState(() {
      currentPage = _textMoviePageController.page!;
    });
  }

  void datePageListener() {
    setState(() {
      currentPage = _dateMoviePageController.page!;
    });
  }

  List<Movie> movieList = [
    Movie(
        title: 'Pirate des carraibes',
        director: Person(firstName: 'Lorem', secondName: 'Ipsum'),
        castings: [],
        genre: 'Aventure',
        resume:
            'Petite, Elizabeth Swann, la fille du gouverneur, a sauvé de la noyade Will Turner après le naufrage de son bateau. Les années ont passé, Will et Elizabeth ont grandi. Will est devenu forgeron à Port Royal, et Elizabeth se prépare à épouser le commodore Norrington. Cependant, la vie d\'Elizabeth bascule lorsque le capitaine Barbossa et sa bande de pirates décident d\'attaquer Port Royal et la prennent en otage. Malheureusement pour lui, Barbossa a commis deux erreurs.',
        date: [DateTime(2022, 11, 6, 2, 30), DateTime.now()],
        durationInMinute: 128,
        posterLink:
            'https://m.media-amazon.com/images/M/MV5BMjE5MjkwODI3Nl5BMl5BanBnXkFtZTcwNjcwMDk4NA@@._V1_.jpg'),
    Movie(
        title: 'Mon ami DAHMER',
        director: Person(firstName: 'Lorem', secondName: 'Ipsum'),
        castings: [],
        genre: 'Drame',
        resume:
            'Jeffrey Dahmer, né le 21 mai 1960 à Milwaukee et mort le 28 novembre 1994 à Portage, surnommé « le cannibale de Milwaukee », est un tueur en série américain qui a avoué avoir assassiné dix-sept jeunes hommes gays entre 1978 et 1991, pour la plupart issus de la communauté afro-américaine.',
        date: [DateTime(2022, 11, 7, 00, 45)],
        durationInMinute: 144,
        posterLink:
            'https://m.media-amazon.com/images/M/MV5BN2UxZDJlYjAtNGQ0OC00MWE4LTkzMjktMDAyNTg2ZTVkZjQ1XkEyXkFqcGdeQXVyMTc2MDc0Nw@@._V1_FMjpg_UX1000_.jpg'),
    Movie(
        title: 'Le roi Julian l\'elu des lemures',
        durationInMinute: 139,
        director: Person(firstName: 'Lorem', secondName: 'Ipsum'),
        castings: [],
        genre: 'Aimation-Comedie',
        resume:
            'Après l\'abdication de son oncle, Julian, un lémurien fêtard et indiscipliné, monte sur le trône. Maladroit et gaffeur, il est conseillé avec sagesse par son ami Maurice. Clover, quant à elle, veille à sa sécurité. Très vite, Julian est confronté aux enquêtes d\'opinion. Lorsqu\'il apprend que ses sujets ne sont satisfait qu\'à 99%, il déprime. Qui a osé le critiquer ? Plus tard, il apprend que quelqu\'un a saboté sa piscine. La vie n\'est pas de tout repos dans la jungle. A peine a-t-il eu le temps de s\'habituer à sa nouvelle fonction que son oncle refait son apparition : il veut reprendre sa place. Une série destinée au jeune public, mise en image par les studios Dreamworks et tirée des personnages de "Madagascar".',
        date: [DateTime(2022, 11, 12, 11, 28), DateTime.now()],
        posterLink: 'https://flxt.tmsimg.com/assets/p11233204_b_v9_ab.jpg'),
    Movie(
        title: 'F is for the family',
        durationInMinute: 168,
        director: Person(firstName: 'Lorem', secondName: 'Ipsum'),
        castings: [],
        genre: 'Animation',
        resume:
            'L\'histoire de la famille Murphy dans les années 1970, une époque où l\'on pouvait infliger une fessée à son enfant sans problèmes, fumer dans les lieux publics et emporter une arme à feu à l\'aéroport.',
        date: [DateTime(2022, 11, 14, 11, 24)],
        posterLink:
            'https://upload.wikimedia.org/wikipedia/en/f/f8/F_is_for_Family.jpg')
  ];

  @override
  void initState() {
    // TODO: implement initState
    _moviePageController.addListener(moviePageListener);
    _textMoviePageController.addListener(textPageListener);
    _dateMoviePageController.addListener(datePageListener);
    movieList = MovieMethod().getTodayMovie(list: movieList);
    MovieMethod().getMovieStatus(movie: movieList[0]);
    // if (movieList.isNotEmpty) {
    //   result = DateFormat.d().format(movieList[0].date[0])..toString();
    //   if (movieList[0].date[0].day == DateTime.now().day) {
    //     result = "Aujourd'hui";
    //   }
    // }
    super.initState();
    initializeDateFormatting('fr', null);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          child: Text(
            "Aujourd'hui",
            style:
                font(size: 22, colors: Colors.white, weight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 400,
          child: PageView.builder(
            onPageChanged: ((value) {
              // result = DateFormat('EEEE dd', 'fr')
              //     .format(movieList[value].date[0])
              //   ..toString();
              // setState(() {
              //   if (movieList[value].date[0].day == DateTime.now().day) {
              //     result = "Aujourd'hui";
              //   }
              // });
              _textMoviePageController.animateToPage(currentPage.round(),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutQuad);
            }),
            controller: _moviePageController,
            itemCount: movieList.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailScreen(movie: movieList[index])));
                }),
                child: Hero(
                  tag: movieList[index].posterLink,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurStyle: BlurStyle.normal,
                                color: Colors.red.shade400.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 1)
                          ],
                          image: DecorationImage(
                              image: NetworkImage(movieList[index].posterLink),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 15,
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            MovieMethod()
                                .getMovieStatus(movie: movieList[index]),
                            style: font(
                                size: 16,
                                colors: Colors.white,
                                weight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(
          height: 120,
          width: 300,
          child: PageView.builder(
            onPageChanged: (value) {
              _moviePageController.animateToPage(currentPage.round(),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate);
            },
            controller: _textMoviePageController,
            itemCount: movieList.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailScreen(movie: movieList[index])));
                  }),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieList[index].title,
                        style: font(size: 16, colors: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.red.withOpacity(0.5), width: 2),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          movieList[index].getDuration(),
                          style: font(size: 16, colors: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Text(
            'Programmation',
            style: font(size: 18, colors: Colors.white),
          ),
        ),
        const SizedBox(
            width: 80,
            child: Divider(
              thickness: 1,
              color: Colors.red,
            )),
        ...movieList.map((e) => Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  width: 120,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(e.posterLink),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: font(size: 16, colors: Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.red.withOpacity(0.5), width: 2),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          e.getDuration(),
                          style: font(size: 16, colors: Colors.white),
                        ),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(e.date[0]),
                        style: font(size: 16, colors: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}
