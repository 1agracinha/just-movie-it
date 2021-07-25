import 'package:dartz/dartz.dart';
import 'package:moviee/domain/entities/entities.dart';
import 'package:moviee/domain/helpers/helpers.dart';
import 'package:moviee/domain/repositories/repositories.dart';

class GetPopularMoviesUsecase implements Usecase {
  final IPopularMoviesRepository repository;
  GetPopularMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(params) {
    return repository.getPopularMovies();
  }
}
