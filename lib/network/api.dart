import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:searchengine/network/entity.dart';
import 'package:searchengine/util/constants.dart';
import 'package:searchengine/util/secret_loader.dart';

class Api {
  final Uri searchUri =
      Uri.https(ApiConstants.GOOGLE_API_BASE_URL, '/customsearch/v1');

  final http.Client _httpClient;
  final SecretLoader _secretLoader;

  Api(this._httpClient, this._secretLoader);

  Future<ResultEntity> fetchNews(String query) async {
    return _createQueryParams(query).then((params) => fetchNewsWithParams(params));
  }

  Future<ResultEntity> fetchNewsWithParams(Map<String, String> queryParams) async {
    final uri = searchUri.replace(queryParameters: queryParams);
    final response = await _httpClient.get(uri);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return parseSearchResponse(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load items');
    }
  }

  Future<Map<String, String>> _createQueryParams(String query) async {
    final secrets = await _secretLoader.loadSecrets();
    final apiKey = secrets.apiKey ?? ApiConstants.API_KEY;
    final searchEngineId =
        secrets.searchEngineId ?? ApiConstants.SEARCH_ENGINE_ID;
    final Map<String, String> queriesParams = {
      'key': apiKey,
      'cx': searchEngineId,
      'dateRestrict': ApiConstants.DATE_RESTRICT,
    };
    queriesParams['q'] = query;
    return queriesParams;
  }

  ResultEntity parseSearchResponse(String responseBody) {
    final parsed = json.decode(responseBody);
    return ResultEntity.fromJson(parsed);
  }
}
