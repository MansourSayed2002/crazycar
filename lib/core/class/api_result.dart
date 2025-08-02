import 'package:crazycar/core/enum/status_request.dart';

class ApiResult {}

class ApiSuccess<T> extends ApiResult {
  final T data;
  ApiSuccess(this.data);
}

class ApiFailure extends ApiResult {
  final StatusRequest statusRequest;
  final String message;
  ApiFailure({required this.statusRequest, required this.message});
}
