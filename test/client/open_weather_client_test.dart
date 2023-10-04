// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather/client/open_weather_client.dart';
import 'package:weather/models/open_weather_response.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('OpenWeatherClient Success', () {
    late OpenWeatherClient openWeatherClient;
    late http.Client httpClient;

    final openWeatherResponse = OpenWeatherResponse.data();

    setUp(() {
      httpClient = MockClient(
        (request) async => http.Response(
          jsonEncode(openWeatherResponse),
          HttpStatus.ok,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        ),
      );
      openWeatherClient = OpenWeatherClient(client: httpClient);
    });
    test('default constructor', () {
      expect(OpenWeatherClient.new, returnsNormally);
    });

    test('when request weather api then response should be return normally',
        () async {
      expect(
        () => openWeatherClient.getWeatherForCity('Elbistan'),
        returnsNormally,
      );
    });
    test(
        'when request weather api then response type should be OpenWeatherResponse',
        () async {
      final response = await openWeatherClient.getWeatherForCity('Elbistan');

      expect(response, isA<OpenWeatherResponse>());
    });

    test(
        'when request weather api then response should be equals mock response',
        () async {
      final response = await openWeatherClient.getWeatherForCity('Elbistan');

      expect(response, equals(openWeatherResponse));
    });
  });

  group('OpenWeatherClient Exception', () {
    late OpenWeatherClient openWeatherClient;
    late http.Client httpClient;

    setUp(() {
      httpClient = MockClient(
        (request) async => http.Response(
          '',
          HttpStatus.notFound,
        ),
      );
      openWeatherClient = OpenWeatherClient(client: httpClient);
    });

    test('when request weather api then response should be throws exception',
        () async {
      expect(
        () => openWeatherClient.getWeatherForCity('Elbistan'),
        throwsException,
      );
    });

    test(
        'when request weather api then response should be throws OpenWeatherExpception',
        () async {
      expect(
        () => openWeatherClient.getWeatherForCity('Elbistan'),
        throwsA(const TypeMatcher<OpenWeatherExpception>()),
      );
    });
  });
}
