import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String weatherUrl;
  final String airUrl;
  Network(this.weatherUrl, this.airUrl);

  Future<dynamic> getJsonData() async {
    var response = await http.get(Uri.parse(weatherUrl));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      var parsingData = jsonDecode(jsonData);

      return parsingData;
    }
  }

  Future<dynamic> getAirData() async {
    var response = await http.get(Uri.parse(airUrl));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      var parsingData = jsonDecode(jsonData);

      return parsingData;
    }
  }
}
