import 'dart:async';
import 'dart:convert' show json;
import 'dart:io';

import 'package:flutter_app/model/serializer/serializers.dart';
import 'package:flutter_app/model/server/login_response.dart';
import 'package:flutter_app/service/preferences_service.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:http/http.dart' as http;

const _tag = "api_service";

class HttpCode {
  static const OK = 200;
  static const TIME_OUT = 504;
}

class ApiService {
  static const _timeoutDuration = Duration(seconds: 30);
  static const _headers = {"Content-type": "application/json"};
  static const _baseAddress = "yamal.terra-incognita.tk";

  final PreferencesService _preferencesService;
  final _client = http.Client();

  ApiService(this._preferencesService);

  Future<LoginResponse> login(String token) async {
    Map<String, String> params = {
      'token': '$token',
    };
    Map<String, dynamic> jsonResponse = await _post(
      '/parent/login',
      params: params,
    );
    if (jsonResponse == null || jsonResponse.isEmpty) {
      Log.d(_tag, "Response is null or empty");
      return null;
    }
    return deserialize<LoginResponse>(jsonResponse);
  }

  Future<bool> addChildPhoto(String childId, File photo) async {
    final uri = _buildUri(
        "/parent/${_preferencesService.getCurrentUser()}/$childId/addChildPhoto");
    var request = http.MultipartRequest("POST", uri);
    request.files.add(
      http.MultipartFile.fromBytes(
        'pic',
        await photo.readAsBytes(),
        filename: "pic",
      ),
    );

    final response = await request.send();

    Log.d(_tag, "<- POST url = $uri, code = ${response.statusCode}");

    return response.statusCode == HttpCode.OK;
  }

  Future<dynamic> _get(String path, {Map<String, String> params}) async {
    final uri = _buildUri("$path", params: params);
    Log.d(_tag, "-> GET url = $uri, params = $params");

    final response = await _client
        .get(uri)
        .timeout(_timeoutDuration, onTimeout: _onTimeout)
        .catchError((error) {
      Log.e(_tag,
          "<- GET url = $uri, Error while making GET request, error = $error");
      return null;
    });

    if (response == null) {
      return null;
    }

    Log.d(_tag, "<- GET url = $uri, code = ${response.statusCode}");
    Log.d(_tag, "<- GET url = $uri, body = ${response.body}");

    if (response.statusCode != HttpCode.OK) {
      return null;
    }

    return json.decode(response.body);
  }

  Future<dynamic> _post(
    String path, {
    body,
    Map<String, String> params,
  }) async {
    final uri = _buildUri("$path", params: params);
    Log.d(_tag, "-> POST url = $uri, params = $params, body = $body");

    final response = await _client
        .post(uri, body: body, headers: _headers)
        .timeout(_timeoutDuration, onTimeout: _onTimeout)
        .catchError((error) {
      Log.e(_tag,
          "<- POST url = $uri, Error while making POST request, error = $error");
      return null;
    });

    if (response == null) {
      return null;
    }

    Log.d(_tag, "<- POST url = $uri, code = ${response.statusCode}");
    Log.d(_tag, "<- POST url = $uri, body = ${response.body}");

    if (response.statusCode != HttpCode.OK) {
      return null;
    }

    if (response.body == null || response.body.isEmpty) {
      return null;
    }
    return json.decode(response.body);
  }

  Future<bool> _delete(String path, {Map<String, String> params}) async {
    final uri = _buildUri("$path", params: params);
    Log.d(_tag, "-> DELETE url = $uri, params = $params");

    final response = await _client
        .delete(uri)
        .timeout(_timeoutDuration, onTimeout: _onTimeout)
        .catchError((error) {
      Log.e(_tag,
          "<- DELETE url = $uri, Error while making DELETE request, error = $error");
      return null;
    });

    if (response == null) {
      return false;
    }

    Log.d(_tag, "<- DELETE url = $uri, code = ${response.statusCode}");
    Log.d(_tag, "<- DELETE url = $uri, body = ${response.body}");

    if (response.statusCode != HttpCode.OK) {
      return false;
    }

    return true;
  }

  Uri _buildUri(String path, {Map<String, String> params}) {
    return Uri.http(_baseAddress, path, params);
  }

  http.Response _onTimeout() {
    Log.e(_tag, "Request timeout ${_timeoutDuration.inSeconds}s");
    return http.Response("Timeout error", HttpCode.TIME_OUT);
  }

  String _getUserId() {
    return _preferencesService.getCurrentUser();
  }
}
