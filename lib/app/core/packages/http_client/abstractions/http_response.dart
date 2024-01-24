import 'dart:typed_data';

class HttpResponse {
  final String data;
  final Uint8List dataInBytes;
  final int statusCode;

  const HttpResponse({
    required this.data,
    required this.dataInBytes,
    required this.statusCode,
  });
}
