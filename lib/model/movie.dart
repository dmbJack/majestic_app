import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:majestic_app/model/person.dart';



class Movie {
  final String title;
  final String resume;
  final List<DateTime> date;
  final int durationInMinute;
  final String posterLink;
  final String? trailerLink;
  final List<Person> castings;
  final String genre;
  final Person director;
  Movie({
    required this.title,
    required this.resume,
    required this.date,
    required this.durationInMinute,
    required this.posterLink,
    this.trailerLink,
    required this.castings,
    required this.genre,
    required this.director,
  });

  Movie copyWith({
    String? title,
    String? resume,
    List<DateTime>? date,
    int? durationInMinute,
    String? posterLink,
    String? trailerLink,
    List<Person>? castings,
    String? genre,
    Person? director,
  }) {
    return Movie(
      title: title ?? this.title,
      resume: resume ?? this.resume,
      date: date ?? this.date,
      durationInMinute: durationInMinute ?? this.durationInMinute,
      posterLink: posterLink ?? this.posterLink,
      trailerLink: trailerLink ?? this.trailerLink,
      castings: castings ?? this.castings,
      genre: genre ?? this.genre,
      director: director ?? this.director,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'resume': resume});
    result.addAll({'date': date.map((x) => x.millisecondsSinceEpoch).toList()});
    result.addAll({'durationInMinute': durationInMinute});
    result.addAll({'posterLink': posterLink});
    if (trailerLink != null) {
      result.addAll({'trailerLink': trailerLink});
    }
    result.addAll({'castings': castings.map((x) => x.toMap()).toList()});
    result.addAll({'genre': genre});
    result.addAll({'director': director.toMap()});

    return result;
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? '',
      resume: map['resume'] ?? '',
      date: List<DateTime>.from(
          map['date']?.map((x) => DateTime.fromMillisecondsSinceEpoch(x))),
      durationInMinute: map['durationInMinute']?.toInt() ?? 0,
      posterLink: map['posterLink'] ?? '',
      trailerLink: map['trailerLink'],
      castings:
          List<Person>.from(map['castings']?.map((x) => Person.fromMap(x))),
      genre: map['genre'] ?? '',
      director: Person.fromMap(map['director']),
    );
  }

  String getDuration() {
    int hour = 0;
    int minute = 0;
    if (durationInMinute >= 60) {
      hour = durationInMinute ~/ 60;
      minute = durationInMinute % 60;
    }
    return '${hour}h ${minute}min';
  }
}
