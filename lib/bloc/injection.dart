import 'package:searchengine/bloc/news_bloc.dart';
import 'package:searchengine/model/dto.dart';
import 'package:searchengine/network/api.dart';
import 'package:searchengine/network/entity.dart';
import 'package:searchengine/network/mapper.dart';
import 'package:searchengine/data/cache.dart';
import 'package:searchengine/data/repository.dart';
import 'package:http/http.dart' as http;
import 'package:searchengine/util/constants.dart';
import 'package:searchengine/util/secret_loader.dart';

class Injection {
  static final Injection _instance = Injection.internal();

  factory Injection() => _instance;

  Injection.internal();

  static final _httpClient = http.Client();
  static final SecretLoader _secretLoader =
      SecretLoader(ApiConstants.API_SECRETS_PATH);
  static final Api _api = Api(_httpClient, _secretLoader);
  static final Cache<List<NewsItemDto>> _newsCache =
      MemCache<List<NewsItemDto>>();
  static final Mapper<ResultEntity, List<NewsItemDto>> _resultMapper =
      ResultItemMapper();
  static final NewsRepository _newsRepository = NewsRepositoryImpl(
    api: _api,
    cache: _newsCache,
    mapper: _resultMapper,
  );

  static final NewsBloc _newsBloc = NewsBloc(_newsRepository);

  NewsBloc provideNewsBloc() => _newsBloc;
}
