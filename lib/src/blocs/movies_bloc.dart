import 'package:movies_app/src/models/movies_model.dart';
import 'package:movies_app/src/resources/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';

class MoviesBloc implements BlocBase {
  
  final _repository = MoviesRepository();
  final _popularMoviesFetcher = PublishSubject<MoviesModel>();
  Sink<MoviesModel> get _inPopularList => _popularMoviesFetcher.sink;
  Stream<MoviesModel> get outPopular => _popularMoviesFetcher.stream;

  final _topRatedMoviesFetcher = PublishSubject<MoviesModel>();
  Sink<MoviesModel> get _inTopRatedList => _topRatedMoviesFetcher.sink;
  Stream<MoviesModel> get outTopRated => _topRatedMoviesFetcher.stream;

  MoviesBloc() {
    _repository.fetchAllMovies('popular').then((movies) {
      _inPopularList.add(movies);
    });
    _repository.fetchAllMovies('top_rated').then((movies) {
      _inTopRatedList.add(movies);
    });
  }

  @override
  dispose() {
    _popularMoviesFetcher.close();
  }
}
