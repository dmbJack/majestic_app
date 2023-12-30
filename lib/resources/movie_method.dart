import 'package:majestic_app/model/movie.dart';

class MovieMethod {
  List<Movie> getTodayMovie({required List<Movie> list}) {
    List<Movie> todayMovieList = [];
    final DateTime dateNow = DateTime.now();
    for (var i = 0; i < list.length; i++) {
      for (var date in list[i].date) {
        if (dateNow.day == date.day && dateNow.month == date.month) {
          todayMovieList.add(list[i]);
        }
      }
    }
    return todayMovieList;
  }

  String getMovieStatus({required Movie movie}) {
    List<Movie> result = getTodayMovie(list: [movie]);
    String status = 'Terminé';
    final DateTime dateNow = DateTime.now();
    if (result.isNotEmpty) {
      for (var date in movie.date) {
        if (date.isAfter(dateNow)) {
          status = 'En attente';
        } else {
          final difference = dateNow.difference(date);
          // final dateNowWithDuration = dateNow.minute + movie.durationInMinute;
          if (difference.inMinutes < movie.durationInMinute) {
            status = 'En cours';
          }
        }
      }
    }
    return status;
  }
}
