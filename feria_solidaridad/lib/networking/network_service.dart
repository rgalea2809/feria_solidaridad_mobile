// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:feria_solidaridad/networking/network_request.dart';
import 'package:feria_solidaridad/networking/network_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class NetworkServiceType {
  Future<NetworkResponse> execute(NetworkRequest request);
}

class NetworkService implements NetworkServiceType {
  final String baseUrl;

  NetworkService({
    required this.baseUrl,
  });

  @override
  Future<NetworkResponse> execute(NetworkRequest request) async {
    switch (request.type) {
      case NetworkRequestType.GET:
        return executeGet(request);
      case NetworkRequestType.POST:
        return executePost(request);
      default:
        return executeGet(request);
    }
  }

  Future<NetworkResponse> executeGet(
    NetworkRequest request,
  ) async {
    var url = Uri.https(baseUrl, request.path);
    var response = await http.get(url, headers: request.headers);

    if (response.statusCode != 200) {
      return NetworkResponse(
        status: NetworkResponseStatus.error,
      );
    }

    return NetworkResponse(
      status: NetworkResponseStatus.ok,
      data: json.decode(response.body),
    );
  }

  Future<NetworkResponse> executePost(
    NetworkRequest request,
  ) async {
    var url = Uri.https(baseUrl, request.path);
    var response =
        await http.post(url, body: request.data.body, headers: request.headers);

    if (response.statusCode != 200) {
      return NetworkResponse(
        status: NetworkResponseStatus.error,
      );
    }

    return NetworkResponse(
      status: NetworkResponseStatus.ok,
      data: json.decode(response.body),
    );
  }

  Future<NetworkResponse> execureDelete(
    NetworkRequest request,
  ) async {
    var url = Uri.https(baseUrl, request.path);
    var response = await http.delete(url,
        headers: request.headers, body: request.data.body);

    if (response.statusCode != 200) {
      return NetworkResponse(
        status: NetworkResponseStatus.error,
      );
    }

    return NetworkResponse(
      status: NetworkResponseStatus.ok,
      data: json.decode(response.body),
    );
  }
}
