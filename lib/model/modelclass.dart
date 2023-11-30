class WeatherModel {
  double? temp;
  int? humidity;
  String? description;
  String? name;

  WeatherModel({this.temp, this.humidity, this.description,this.name});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    temp = json["main"]['temp'];
    humidity = json["main"]["humidity"];
    description = json["weather"][0]["description"];
    name = json['name'];
  }
}


