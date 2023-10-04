import 'dart:convert';
import 'dart:isolate';

import 'package:http/http.dart' as http;
import 'package:weather/models/open_weather_response.dart';

const _baseUrl = 'api.openweathermap.org';
const _weatherUrl = '/data/2.5/weather';
const apiKey = '_open_weather_api_key_';

final class OpenWeatherExpception implements Exception {
  OpenWeatherExpception({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;
}

final class OpenWeatherClient {
  OpenWeatherClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<OpenWeatherResponse?> getWeatherForCity(String city) async {
    try {
      final uri = Uri.https(
        _baseUrl,
        _weatherUrl,
        {
          'q': city,
          'APPID': apiKey,
        },
      );

      final response = await _client.get(uri);
      if (response.statusCode == 200) {
        final json = await Isolate.run(() => jsonDecode(response.body));
        if (json is Map<String, dynamic>) {
          return OpenWeatherResponse.fromJson(json);
        } else {
          Error.throwWithStackTrace(
            OpenWeatherExpception(
              message: '${json.runtimeType} is not Map<String,dynamic>.',
              statusCode: response.statusCode,
            ),
            StackTrace.current,
          );
        }
      } else {
        Error.throwWithStackTrace(
          OpenWeatherExpception(
            message: 'Error occurred while getting data. '
                'Status:${response.statusCode}',
            statusCode: response.statusCode,
          ),
          StackTrace.current,
        );
      }
    } on http.ClientException catch (exception, stackTrace) {
      final openWeatherException = OpenWeatherExpception(
        message: exception.message,
        statusCode: 0,
      );
      Error.throwWithStackTrace(openWeatherException, stackTrace);
    } finally {
      _client.close();
    }
  }
}
