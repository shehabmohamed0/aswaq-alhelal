import '../core/network/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @injectable
  Dio get googleSignIn => DioFactory().getDio();
}
