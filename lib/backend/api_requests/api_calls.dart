import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Hajari API Group Code

class HajariAPIGroup {
  static String baseUrl = 'https://uat.hajari.in/api/admin';
  static Map<String, String> headers = {};
  static TopCompaniesCall topCompaniesCall = TopCompaniesCall();
  static CompanyListCall companyListCall = CompanyListCall();
  static UsersListCall usersListCall = UsersListCall();
  static LoginCall loginCall = LoginCall();
}

class TopCompaniesCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Top Companies',
      apiUrl: '${HajariAPIGroup.baseUrl}/top-list',
      callType: ApiCallType.GET,
      headers: {
        ...HajariAPIGroup.headers,
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data[*]''',
        true,
      );
}

class CompanyListCall {
  Future<ApiCallResponse> call({
    int? currentPage = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Company List',
      apiUrl: '${HajariAPIGroup.baseUrl}/company',
      callType: ApiCallType.GET,
      headers: {
        ...HajariAPIGroup.headers,
      },
      params: {
        'page': currentPage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      );
  dynamic currentPage(dynamic response) => getJsonField(
        response,
        r'''$.data.current_page''',
      );
  dynamic lastPage(dynamic response) => getJsonField(
        response,
        r'''$.data.last_page''',
      );
  dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.data.total''',
      );
  dynamic perPage(dynamic response) => getJsonField(
        response,
        r'''$.data.per_page''',
      );
  dynamic to(dynamic response) => getJsonField(
        response,
        r'''$.data.to''',
      );
  dynamic from(dynamic response) => getJsonField(
        response,
        r'''$.data.from''',
      );
}

class UsersListCall {
  Future<ApiCallResponse> call({
    int? currentPage = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Users List ',
      apiUrl: '${HajariAPIGroup.baseUrl}/user',
      callType: ApiCallType.GET,
      headers: {
        ...HajariAPIGroup.headers,
      },
      params: {
        'page': currentPage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      );
  dynamic currentPage(dynamic response) => getJsonField(
        response,
        r'''$.data.current_page''',
        true,
      );
  dynamic lastPage(dynamic response) => getJsonField(
        response,
        r'''$.data.last_page''',
        true,
      );
  dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.data.total''',
        true,
      );
  dynamic perPage(dynamic response) => getJsonField(
        response,
        r'''$.data.per_page''',
        true,
      );
  dynamic to(dynamic response) => getJsonField(
        response,
        r'''$.data.to''',
        true,
      );
  dynamic from(dynamic response) => getJsonField(
        response,
        r'''$.data.from''',
        true,
      );
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = 'fiveonedigital@gmail.com',
    String? password = '1234',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${HajariAPIGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        ...HajariAPIGroup.headers,
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.data.email''',
      );
}

/// End Hajari API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
