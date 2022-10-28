import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/core/data/factories/model_factory.dart';

import '../../error/exception.dart';

abstract class BaseApi<TModel, TModelFactory extends ModelFactory<TModel>> {
  final Map<String, String> _headers = {'Content-Type': 'applications/json'};
  final String _baseUrl = 'http://localhost:3000';
  late final String _basePath;
  late final http.Client _client;
  late final TModelFactory _modelFactory;

  BaseApi(
      {required String basePath,
      required http.Client client,
      required TModelFactory modelFactory}) {
    _basePath = basePath;
    _client = client;
    _modelFactory = modelFactory;
  }

  String get basePath => _basePath;
  String get baseUrl => _baseUrl;
  http.Client get client => _client;
  Map<String, String> get headers => _headers;
  TModelFactory get modelFactory => _modelFactory;

  Future<TModel> getOneFromPath(String path) async {
    Map<String, dynamic> jsonObject = await _getFromPath(path);
    return modelFactory.fromJson(jsonObject);
  }

  Future<List<TModel>> getManyFromPath(String path) async {
    List<Map<String, dynamic>> jsonObjects = await _getFromPath(path);
    return jsonObjects.map((obj) => modelFactory.fromJson(obj)).toList();
  }

  Future<dynamic> _getFromPath(String path) async {
    Uri uri = Uri.parse('$baseUrl/$basePath/$path');
    final response = await client.get(uri, headers: headers);
    _checkResponse(response);

    return jsonDecode(response.body);
  }

  void _checkResponse(http.Response response) {
    if (response.statusCode == 200) return;
    throw ServerException();
  }
}
