import 'package:crazycar/core/constants/text_app.dart';
import 'package:crazycar/core/enum/status_request.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class PostgresError {
  StatusRequest get status;
  String get message;
}

class PostgresUniqueUnKnow implements PostgresError {
  @override
  StatusRequest get status => StatusRequest.none;

  @override
  String get message => TextApp.error;
}

class PostgresUniquePhone implements PostgresError {
  @override
  StatusRequest get status => StatusRequest.violatesUniquePhone;

  @override
  String get message => TextApp.violatesUniquePhone.tr();
}

class PostgresUniqueToken implements PostgresError {
  @override
  StatusRequest get status => StatusRequest.violatesUniqueToken;

  @override
  String get message => TextApp.violatesUniqueToken.tr();
}

class FactoryPostgresError {
  static PostgresError getPostgresError(String message) {
    if (message.contains("unique constraint") &&
        message.contains("driver_token")) {
      return PostgresUniqueToken();
    } else if (message.contains("unique constraint") &&
        message.contains("driver_phone")) {
      return PostgresUniquePhone();
    }
    return PostgresUniqueUnKnow();
  }
}
