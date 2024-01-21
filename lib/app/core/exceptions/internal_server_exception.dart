import 'app_exception.dart';

class InternalServerException extends AppException {
  InternalServerException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}
