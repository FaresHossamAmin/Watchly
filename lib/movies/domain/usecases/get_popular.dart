import 'package:dartz/dartz.dart';
import 'package:watchly/core/errors/failure.dart';
import 'package:watchly/core/usecase/base_usecase.dart';
import 'package:watchly/movies/domain/entities/movie_entity.dart';
import 'package:watchly/movies/domain/repositories/base_movie_repository.dart';

class GetPopularUseCase extends BaseUsecase<List<MovieEntity>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetPopularUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameters _) async {
    return await baseMovieRepository.repoPopular();
  }
}
