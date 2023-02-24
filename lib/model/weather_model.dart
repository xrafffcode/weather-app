class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feelsLike;
  int? pressure;
  String? icon;
  String? description;

  Weather(
      {this.cityName,
      this.temp,
      this.wind,
      this.humidity,
      this.feelsLike,
      this.pressure,
      this.icon,
      this.description});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        temp: json['main']['temp'],
        wind: json['wind']['speed'],
        humidity: json['main']['humidity'],
        feelsLike: json['main']['feels_like'],
        pressure: json['main']['pressure'],
        icon: json['weather'][0]['icon'],
        description: json['weather'][0]['description']);
  }
}
