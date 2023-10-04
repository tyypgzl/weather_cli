import 'package:equatable/equatable.dart';

final class OpenWeatherResponse with EquatableMixin {
  const OpenWeatherResponse({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory OpenWeatherResponse.data() {
    return const OpenWeatherResponse(
      coord: Coord(lat: 37.1983, lon: 38.2059),
      weather: [
        Weather(
          id: 800,
          main: 'Clear',
          description: 'clear sky',
          icon: '01d',
        ),
      ],
      base: 'stations',
      main: Main(
        temp: 286.89,
        feelsLike: 285.73,
        tempMin: 286.89,
        tempMax: 286.89,
        pressure: 1021,
        humidity: 54,
        seaLevel: 1021,
        grndLevel: 893,
      ),
      visibility: 10000,
      wind: Wind(
        speed: 1.21,
        deg: 352,
        gust: 1.7,
      ),
      clouds: Clouds(
        all: 6,
      ),
      dt: 1696398205,
      sys: Sys(
        country: 'TR',
        sunrise: 1696390137,
        sunset: 1696432261,
      ),
      timezone: 10800,
      id: 315795,
      name: 'Elbistan',
      cod: 200,
    );
  }

  factory OpenWeatherResponse.fromJson(Map<String, dynamic> json) {
    return OpenWeatherResponse(
      coord: json['coord'] == null
          ? null
          : Coord.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String?,
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as int?,
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'] as int?,
      sys: json['sys'] == null
          ? null
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      cod: json['cod'] as int?,
    );
  }

  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  Map<String, dynamic> toJson() {
    return {
      'coord': coord,
      'weather': weather,
      'base': base,
      'main': main,
      'visibility': visibility,
      'wind': wind,
      'clouds': clouds,
      'dt': dt,
      'sys': sys,
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  @override
  String toString() => 'OpenWeatherResponse(coord: $coord,weather: $weather'
      ',base: $base,main: $main,visibility: $visibility,wind: $wind'
      ',clouds: $clouds,dt: $dt,sys: $sys,timezone: $timezone'
      ',id: $id,name: $name,cod: $cod)';

  @override
  List<Object?> get props {
    return [
      coord,
      weather,
      base,
      main,
      visibility,
      wind,
      clouds,
      dt,
      sys,
      timezone,
      id,
      name,
      cod,
    ];
  }
}

final class Coord with EquatableMixin {
  const Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'] as double?,
      lat: json['lat'] as double?,
    );
  }
  final double? lon;
  final double? lat;

  Map<String, dynamic> toJson() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }

  @override
  String toString() => 'Coord(lon: $lon,lat: $lat)';

  @override
  List<Object?> get props => [lon, lat];
}

final class Weather with EquatableMixin {
  const Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );
  }
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  @override
  String toString() =>
      'Weather(id: $id,main: $main,description: $description,icon: $icon)';

  @override
  List<Object?> get props => [id, main, description, icon];
}

final class Main with EquatableMixin {
  const Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'] as double?,
      feelsLike: json['feels_like'] as double?,
      tempMin: json['temp_min'] as double?,
      tempMax: json['temp_max'] as double?,
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      seaLevel: json['sea_level'] as int?,
      grndLevel: json['grnd_level'] as int?,
    );
  }
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
    };
  }

  @override
  String toString() =>
      'Main(temp: $temp,feelsLike: $feelsLike,tempMin: $tempMin'
      ',tempMax: $tempMax,pressure: $pressure,humidity: $humidity'
      ',seaLevel: $seaLevel,grndLevel: $grndLevel)';

  @override
  List<Object?> get props {
    return [
      temp,
      feelsLike,
      tempMin,
      tempMax,
      pressure,
      humidity,
      seaLevel,
      grndLevel,
    ];
  }
}

final class Wind with EquatableMixin {
  const Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'] as double?,
      deg: json['deg'] as int?,
      gust: json['gust'] as double?,
    );
  }
  final double? speed;
  final int? deg;
  final double? gust;

  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  @override
  String toString() => 'Wind(speed: $speed,deg: $deg,gust: $gust)';

  @override
  List<Object?> get props => [speed, deg, gust];
}

final class Clouds with EquatableMixin {
  const Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'] as int?,
    );
  }
  final int? all;

  Map<String, dynamic> toJson() {
    return {
      'all': all,
    };
  }

  @override
  String toString() => 'Clouds(all: $all)';

  @override
  List<Object?> get props => [all];
}

final class Sys with EquatableMixin {
  const Sys({
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      country: json['country'] as String?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
    );
  }
  final String? country;
  final int? sunrise;
  final int? sunset;

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  @override
  String toString() =>
      'Sys(country: $country,sunrise: $sunrise,sunset: $sunset)';

  @override
  List<Object?> get props => [country, sunrise, sunset];
}
