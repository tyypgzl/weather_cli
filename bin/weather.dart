import 'package:weather/weather.dart' show WeatherCommandRunner;

Future<void> main(List<String> arguments) async {
  await WeatherCommandRunner().run(arguments);
}
