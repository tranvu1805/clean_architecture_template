import 'dart:async';

import 'package:{{project_name}}/core/error/exceptions.dart';
import 'package:{{project_name}}/core/error/failure.dart';
import 'package:{{project_name}}/core/utils/method/type_definition.dart';
import 'package:fpdart/fpdart.dart';

class ApiHelper {
  static ResultFuture<T> handle<T>(Future<T> Function() action) async {
    try {
      final result = await action().timeout(const Duration(seconds: 10));
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } on TimeoutException catch (e) {
      return Left(ConnectFailure.fromException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 505));
    }
  }
}
