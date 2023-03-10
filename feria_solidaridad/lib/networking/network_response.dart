enum NetworkResponseStatus { ok, error }

class NetworkResponse {
  Map<String, dynamic>? data;
  NetworkResponseStatus status;

  NetworkResponse({
    this.data,
    required this.status,
  });
}
