import 'dart:async';

import 'package:searchengine/data/cache.dart';
import 'package:searchengine/model/dto.dart';
import 'package:searchengine/network/api.dart';
import 'package:searchengine/network/entity.dart';
import 'package:searchengine/network/mapper.dart';

abstract class NewsRepository {
  Future<List<NewsItemDto>> getNews(String query);
}

class NewsRepositoryImpl implements NewsRepository {
  final Api api;
  final Mapper<ResultEntity, List<NewsItemDto>> mapper;
  final Cache<List<NewsItemDto>> cache;

  NewsRepositoryImpl({this.api, this.cache, this.mapper});

  @override
  Future<List<NewsItemDto>> getNews(String query) {
    return cache.contains(query)
        ? cache.get(query)
        : api
            .fetchNews(query)
            .then((resultEntity) => _mapAndSaveToCache(query, resultEntity));
  }

  List<NewsItemDto> _mapAndSaveToCache(String key, ResultEntity resultEntity) {
    final items = mapper.mapFromEntity(resultEntity);
    cache.put(key, items);
    return items;
  }
}
