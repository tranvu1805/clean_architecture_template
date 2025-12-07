import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class DI {
  static final DI instance = DI._();

  DI._();

  final sl = GetIt.I;

  Future<void> init() async {
    //init here
  }
}