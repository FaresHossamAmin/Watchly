import 'package:watchly/movies/domain/entities/genre.dart';

class GenreModel extends Genre {
  const GenreModel({required super.genreId, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(genreId: json['id'], name: json['name']);
  }
}
