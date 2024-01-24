import 'dart:convert';

import 'package:hive/hive.dart';

import '../abstractions/i_local_storage_service.dart';
import '../abstractions/local_storage_service_exceptions.dart';

class LocalStorageService implements ILocalStorageService {
  @override
  Future<Map<String, dynamic>> get({required String key}) async {
    try {
      final containsKey = await contains(key: key);

      final unableToGetDataException = UnableToGetDataException(
        description: 'No value found for the $key',
      );

      if (!containsKey) throw unableToGetDataException;

      final box = await Hive.openBox('favoritePokemons');

      final result = await box.get(key);

      if (result == null) throw unableToGetDataException;

      return json.decode(result);
    } catch (exception) {
      throw LocalStorageServiceException(
        error: exception,
        description: exception.toString(),
      );
    }
  }

  @override
  Future<void> store({
    required Map<String, dynamic> value,
    required String key,
  }) async {
    try {
      final box = await Hive.openBox('favoritePokemons');
      await box.put(key, json.encode(value));
    } catch (exception) {
      throw LocalStorageServiceException(
        error: exception,
        description: exception.toString(),
      );
    }
  }

  @override
  Future<bool> contains({required String key}) async {
    try {
      final box = await Hive.openBox('favoritePokemons');
      final value = box.containsKey(key);
      return value;
    } catch (exception) {
      throw LocalStorageServiceException(
        error: exception,
        description: exception.toString(),
      );
    }
  }

  @override
  Future<void> delete({required String key}) async {
    try {
      final containsKey = await contains(key: key);

      if (!containsKey) {
        throw UnableToGetDataException(
          description: 'No value found for the $key',
        );
      }

      final box = await Hive.openBox('favoritePokemons');
      await box.delete(key);
    } catch (exception) {
      throw LocalStorageServiceException(
        error: exception,
        description: exception.toString(),
      );
    }
  }
}
