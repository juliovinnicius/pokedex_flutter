import '../../../../core/exceptions/app_exception.dart';

class HomeException extends AppException {
  HomeException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToGetPokemonDetailException extends HomeException {
  UnableToGetPokemonDetailException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToGetAllPokemonsException extends HomeException {
  UnableToGetAllPokemonsException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class InvalidRequestOffsetException extends HomeException {
  InvalidRequestOffsetException({
    super.description = 'The request offset is not valid',
    super.error,
    super.stackTrace,
  });
}

class UnableToGetPokemonSpeciesException extends HomeException {
  UnableToGetPokemonSpeciesException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToStoreFavoritePokemonException extends HomeException {
  UnableToStoreFavoritePokemonException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToGetPokemonDetailFromLocalStorageException extends HomeException {
  UnableToGetPokemonDetailFromLocalStorageException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToRemoveFavoritePokemonFromLocalStorageException
    extends HomeException {
  UnableToRemoveFavoritePokemonFromLocalStorageException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}
