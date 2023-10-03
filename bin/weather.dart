import 'dart:io';

import 'package:weather/weather.dart' show WeatherCommandRunner;

Future<void> main(List<String> arguments) async {
  await _flushThenExit(await WeatherCommandRunner().run(arguments));
}

Future<void> _flushThenExit(int status) {
  return Future.wait<void>([stdout.close(), stderr.close()])
      .then<void>((_) => exit(status));
}
