import '../../../exceptions/app_exception.dart';

class LocalStorageServiceException extends AppException {
  LocalStorageServiceException({
    super.error,
    required super.description,
  });
}

class UnableToGetDataException extends LocalStorageServiceException {
  UnableToGetDataException({required super.description});
}
