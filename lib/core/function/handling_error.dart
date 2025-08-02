import 'package:crazycar/core/class/api_result.dart';
import 'package:crazycar/core/class/postgres_error.dart';
import 'package:crazycar/core/enum/status_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

ApiFailure handleError(e) {
  if (e is PostgrestException) {
    final postgresError = FactoryPostgresError.getPostgresError(e.message);
    return ApiFailure(
      statusRequest: postgresError.status,
      message: postgresError.message,
    );
  }
  return ApiFailure(
    statusRequest: StatusRequest.serverfailure,
    message: "Error Server",
  );
}
