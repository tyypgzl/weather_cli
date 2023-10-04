import 'package:test/test.dart';
import 'package:weather/models/open_weather_response.dart';

void main() {
  group('OpenWeatherResponse', () {
    test('can be (de)serialize', () async {
      final openWeatherResponse = OpenWeatherResponse.data();

      expect(
        OpenWeatherResponse.fromJson(openWeatherResponse.toJson()),
        equals(openWeatherResponse),
      );
    });
  });
}
