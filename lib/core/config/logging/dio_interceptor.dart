// ignore_for_file: type_annotate_public_apis, parameter_assignments, inference_failure_on_untyped_parameter, use_string_buffers

import 'dart:convert';
import 'dart:developer';

import 'package:chalkdart/chalk.dart';
import 'package:chalkdart/chalk_x11.dart';
import 'package:dio/dio.dart';
import 'package:eds_test/core/config/api.dart';
import 'package:flutter/foundation.dart';

class DioIntercepter extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.baseUrl = ApiConfig.baseUrl;

    var queryParamteres = '';
    for (final key in options.queryParameters.keys) {
      queryParamteres +=
          '?$key=${options.queryParameters[key]}${options.queryParameters[key] != options.queryParameters.keys.last ? '' : '& '}';
    }
    if (kDebugMode) {
      log(
        name: '  Request ',
        '''
${chalk.white.onDarkBlue('Url       : [${options.method}] ${options.baseUrl}${options.path}$queryParamteres')}
${chalk.white.onDarkBlue('Data      : ${options.data}')}
''',
      );
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      log(name: '   Error  ', '''
${chalk.white.onDarkRed('StatusCode: ${err.response?.statusCode}')}
${chalk.white.onDarkRed('StatusMsg : ${err.response?.statusMessage}')}
${chalk.white.onDarkRed('Message   : ${err.message}')}
${chalk.white.onDarkRed('Type      : ${err.type}')}
${chalk.white.onDarkRed('Data      : ${err.response?.data}')}
${chalk.white.onDarkRed('Headers   : ${err.response?.headers}')}
''');
    }
    super.onError(err, handler);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      log(name: ' Response ', '''
${chalk.white.onDarkGreen('Url       : [${response.requestOptions.method}] ${response.requestOptions.path}')}
${chalk.white.onDarkGreen('StatusCode: ${response.statusCode}')}
${chalk.white.onDarkGreen('StatusMsg : ${response.statusMessage}')}
${chalk.darkGreen.onWhite('Data      : ${prettyJson(response.data)}')}
''');
    }
    super.onResponse(response, handler);
  }
}

String prettyJson(input) {
  if (input is! String) {
    input = json.encode(input);
  }
  if (input.length < 5) return '';
  if (input[0] != '{') return input;
  const decoder = JsonDecoder();
  const encoder = JsonEncoder.withIndent('  ');

  final object = decoder.convert(input);
  final prettyString = encoder.convert(object);
  return prettyString;
}
