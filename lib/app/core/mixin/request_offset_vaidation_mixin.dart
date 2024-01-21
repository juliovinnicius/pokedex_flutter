import 'package:result_dart/result_dart.dart';

import '../../modules/home/domain/exceptions/home_exceptions.dart';
import '../exceptions/app_exception.dart';

mixin class RequestOffsetValidationMixin {
  Result<Unit, AppException> validateRequestOffset(int? offset) {
    final hasValidRequestOffset =
        offset != null ? offset >= 0 && offset.isFinite : true;
    if (hasValidRequestOffset) return const Success(unit);
    return Failure(InvalidRequestOffsetException());
  }
}
