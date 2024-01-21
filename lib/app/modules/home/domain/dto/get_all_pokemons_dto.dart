import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../../../../core/mixin/request_offset_vaidation_mixin.dart';

class GetAllPokemonsDTO with RequestOffsetValidationMixin {
  final int offset;

  const GetAllPokemonsDTO({required this.offset});

  Result<GetAllPokemonsDTO, AppException> validate() =>
      validateRequestOffset(offset).pure(this);
}
