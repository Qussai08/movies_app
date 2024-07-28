import 'package:movies_app/src/models/movies_model.dart';
import 'package:movies_app/src/resources/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';

class MoviesBloc implements BlocBase {
  final _repository = MoviesRepository();

  final _popularMoviesFetcher = PublishSubject<MoviesModel>();
  final _topRatedMoviesFetcher = PublishSubject<MoviesModel>();
  final _nowPlayingMoviesFetcher = PublishSubject<MoviesModel>();

  Sink<MoviesModel> get _inPopularList => _popularMoviesFetcher.sink;
  Sink<MoviesModel> get _inTopRatedList => _topRatedMoviesFetcher.sink;
  Sink<MoviesModel> get _inNowPlayingList => _nowPlayingMoviesFetcher.sink;

  Stream<MoviesModel> get outPopular => _popularMoviesFetcher.stream;
  Stream<MoviesModel> get outTopRated => _topRatedMoviesFetcher.stream;
  Stream<MoviesModel> get outNowPlaying => _nowPlayingMoviesFetcher.stream;

  MoviesBloc() {
    _repository.fetchAllMovies('popular').then((movies) {
      _inPopularList.add(movies);
    });
    _repository.fetchAllMovies('top_rated').then((movies) {
      _inTopRatedList.add(movies);
    });
    _repository.fetchAllMovies('now_playing').then((movies) {
      _inNowPlayingList.add(movies);
    });
  }

  @override
  dispose() {
    _popularMoviesFetcher.close();
  }
}
