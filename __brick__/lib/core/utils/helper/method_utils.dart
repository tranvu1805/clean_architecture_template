import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:{{project_name.snakeCase()}}/core/errors/exceptions.dart';

void throwServerException(http.Response response, int statusCode) {
  if (response.statusCode != statusCode) {
    final body = jsonDecode(response.body);
    final message = body['errors']?[0]['message'] ?? 'Unknown error';
    throw ServerException(message: message, statusCode: response.statusCode);
  }
}