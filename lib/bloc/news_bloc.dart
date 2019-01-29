import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:searchengine/data/repository.dart';
import 'package:searchengine/model/dto.dart';

class NewsBloc {
  NewsRepository _repository;

  ReplaySubject<String> _query = ReplaySubject<String>();

  Sink<String> get query => _query;

  Stream<List<NewsItemDto>> _items = Stream.empty();

  Stream<List<NewsItemDto>> get items => _items;

  NewsBloc(this._repository) {
    _items = _query.distinct().asyncMap(_repository.getNews).asBroadcastStream();
  }

  void dispose() {
    _query.close();
  }
}
