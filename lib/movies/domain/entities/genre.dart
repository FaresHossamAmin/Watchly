import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  final int genreId;
  final String name;
  const Genre({required this.genreId, required this.name});

  @override
  List<Object> get props => [genreId, name];
}
