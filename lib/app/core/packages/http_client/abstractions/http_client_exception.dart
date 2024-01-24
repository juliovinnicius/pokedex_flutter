import '../../../exceptions/app_exception.dart';

class HttpClientException extends AppException {
  HttpClientException({
    required super.error,
    required super.description,
  });
}
