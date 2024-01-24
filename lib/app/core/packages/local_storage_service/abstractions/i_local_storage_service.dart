abstract class ILocalStorageService {
  const ILocalStorageService();

  Future<void> store({
    required Map<String, dynamic> value,
    required String key,
  });

  Future<Map<String, dynamic>> get({required String key});

  Future<bool> contains({required String key});

  Future<void> delete({required String key});
}
