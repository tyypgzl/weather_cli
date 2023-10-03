import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:weather/client/open_weather_client.dart';
import 'package:weather/models/open_weather_response.dart';

const executableName = 'weather';
const description = 'A Weather CLI tool using OpenWeather API.';

class WeatherCommandRunner extends CommandRunner<int> {
  WeatherCommandRunner({
    Logger? logger,
    OpenWeatherClient? client,
  })  : _logger = logger ?? Logger(),
        _client = client ?? OpenWeatherClient(),
        super(executableName, description) {
    argParser.addOption(
      'city',
      help: 'Enter the city you want to know the weather forecast for.',
      defaultsTo: 'London',
    );
  }

  final Logger _logger;
  final OpenWeatherClient _client;

  @override
  Future<int> run(Iterable<String> args) async {
    final topLevelResults = parse(args);
    final city = topLevelResults['city'];

    final weatherProgress = _logger.progress('Fetcing weather data for $city');

    if (city is String) {
      try {
        final weather = await _client.getWeatherForCity(city);

        _logWeather(weather);
        weatherProgress.complete();
      } on OpenWeatherExpception catch (exception) {
        weatherProgress.fail(exception.message);
      }
    }

    return ExitCode.success.code;
  }

  void _logWeather(OpenWeatherResponse? weather) {
    final cityName = weather?.name;
    final weatherType = weather?.weather?.first.main;
    final kelvinTemp = weather?.main?.temp;
    final fahrenheitTemp = kelvinToFahrenheitAndCelcius(kelvinTemp)?.fahrenheit;
    final celciusTemp = kelvinToFahrenheitAndCelcius(kelvinTemp)?.celcius;
    final lat = weather?.coord?.lat;
    final lon = weather?.coord?.lon;
    _logger
      ..success('\n')
      ..success(' -------------------------------')
      ..success('|     City: $cityName')
      ..success('|  Weather: $weatherType')
      ..success('| Temp(°F): $fahrenheitTemp')
      ..success('| Temp(°C): $celciusTemp')
      ..success('|      Lat: $lat')
      ..success('|      Lon: $lon')
      ..success(' -------------------------------');
  }

  ({double celcius, double fahrenheit})? kelvinToFahrenheitAndCelcius(
    double? kelvin,
  ) {
    if (kelvin != null) {
      final fahrenheit = ((kelvin - 273.15) * 1.8) + 32;
      final celcius = kelvin - 273.15;
      return (celcius: celcius, fahrenheit: fahrenheit);
    }
    return null;
  }
}
